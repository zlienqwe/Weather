//
//  WeatherViewController.m
//  Weather
//
//  Created by 朱江 on 15/12/16.
//  Copyright (c) 2015 all. All rights reserved.
//


#import "WeatherViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ForecastWeatherView.h"

@interface WeatherViewController ()

@end

@implementation WeatherViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.imageList = [[NSMutableArray alloc] initWithObjects:@"bg.png", @"bg2.png", @"bg3.png", nil];
  page = 1;
}

- (void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];
  [self createView];
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
  if (self.timer==nil) {
    self.timer=[NSTimer scheduledTimerWithTimeInterval:15.0f target:self selector:@selector(switchImage) userInfo:nil repeats:YES];
  }
}

- (void)viewDidDisappear:(BOOL)animated{
  [super viewDidDisappear:animated];
  if (self.timer != nil) {
    [self.timer invalidate];
    self.timer = nil;
  }
}

- (void)switchImage
{
  CATransition *transition = [CATransition animation];
  transition.duration = 1.0f;
  transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  transition.type = kCATransitionFade;
  transition.delegate = self;
  [self.view.layer addAnimation:transition forKey:nil];

  NSString *imageUrl = [self.imageList objectAtIndex:page];
  [self createGradientBackground:self.view.bounds withURL:imageUrl];
  page = (page + 1) % self.imageList.count;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
  CGFloat sheight = scrollView.contentOffset.y;
  if(sheight >= 0 && sheight <= 260)
  {
    CGFloat alpha = 0.7f * sheight / 260.0f;
    self.scrollView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:alpha];
    self.weatherHeaderView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:alpha];
  }
  else if (sheight > 260)
  {
    self.scrollView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.7f];
    self.weatherHeaderView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.7f];
  }
}


- (void)createGradientBackground:(CGRect)rect withURL:(NSString *)bgURL
{
  UIImage *bgImage=[UIImage imageNamed:bgURL];
  CGSize bgSize=bgImage.size;
  CGRect imageRect;
  if ((bgSize.width/bgSize.height)>(rect.size.width/rect.size.height)) {
    imageRect=CGRectMake(0, 0, rect.size.height*bgImage.size.width/bgImage.size.height, rect.size.height);
  }else{
    imageRect=CGRectMake(0, 0, rect.size.width,rect.size.width*bgImage.size.height/bgImage.size.width);
  }

  UIGraphicsBeginImageContext(imageRect.size);
  [bgImage drawInRect:imageRect];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}

- (void)createView
{
  self.weatherHeaderView = [[WeatherHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
  [self.view addSubview:self.weatherHeaderView];

  self.currentDayWeatherView = [[CurrentDayWeatherView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height - 44.0f)];
  [self.currentDayWeatherView fillViewWithDictionary:nil];
  UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
  [self.currentDayWeatherView addGestureRecognizer:singleTap];
  [self.scrollView addSubview:self.currentDayWeatherView];

  ForecastWeatherView *forecastView = [[ForecastWeatherView alloc] initWithFrame:CGRectMake(8, self.currentDayWeatherView.frame.origin.y + self.currentDayWeatherView.frame.size.height, 304, 208)];
  [self.scrollView addSubview:forecastView];

  self.scrollView.contentSize = CGSizeMake(320, forecastView.frame.origin.y + forecastView.frame.size.height + 60.0f);
  self.scrollView.backgroundColor = [UIColor clearColor];
  self.scrollView.showsVerticalScrollIndicator = NO;
  self.scrollView.delegate = self;
  self.scrollView.clipsToBounds = YES;
}

- (void)singleTapGestureCaptured:(id)sender
{
  CGRect rect = self.scrollView.frame;
  if(self.scrollView.contentOffset.y > 0)
  {
    rect.origin = CGPointMake(0, 0);
  }
  else
  {
    rect.origin = CGPointMake(0, self.view.bounds.size.height - 208.0f);
  }
  [self.scrollView scrollRectToVisible:rect animated:YES];
}

@end