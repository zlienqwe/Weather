//
//  WeatherViewController.h
//  Weather
//
//  Created by 朱江 on 15/12/16.
//  Copyright (c) 2015 all. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "CurrentDayWeatherView.h"
#import "WeatherHeaderView.h"


@interface WeatherViewController : UIViewController<UIScrollViewDelegate>
{
  NSInteger page;
}

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) WeatherHeaderView *weatherHeaderView;
@property (nonatomic, strong) CurrentDayWeatherView *currentDayWeatherView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *imageList;

- (void)createGradientBackground:(CGRect)rect withURL:(NSString *)bgURL;
- (void)createView;
- (void)switchImage;

@end
