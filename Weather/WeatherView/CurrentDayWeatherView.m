//
//  CurrentDayWeatherView.m
//  Weather
//
//  Created by 朱江 on 15/12/16.
//  Copyright © 2015年 all. All rights reserved.
//

#import "CurrentDayWeatherView.h"
static NSString *bundleURL = @"weather_icon.bundle/icon/top_condition_60x60/";

@implementation CurrentDayWeatherView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self createView];
    }
    return self;
}

- (void)createView
{
    CGFloat offSetY = self.frame.size.height - 164.0f;
    
    self.weatherView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10 + offSetY, 28.0, 28.0)];
    self.weatherView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.weatherView];
    
    self.weatherLabel = [[UILabel alloc] initWithFrame:CGRectMake(42, 13 + offSetY, 268.0f, 21)];
    self.weatherLabel.font = [UIFont systemFontOfSize:17.0f];
    self.weatherLabel.textColor = [UIColor whiteColor];
    self.weatherLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.weatherLabel];
    
    UIImageView *upperImageView = [[UIImageView alloc] initWithFrame:CGRectMake(21, 49 + offSetY, 6, 14)];
    upperImageView.image = [UIImage imageNamed:@"Info_high"];
    [self addSubview:upperImageView];
    
    self.upTempLabel = [[UILabel alloc] initWithFrame:CGRectMake(36.0f, 45 + offSetY, 40, 20)];
    self.upTempLabel.font = [UIFont systemFontOfSize:16.0f];
    self.upTempLabel.textColor = [UIColor whiteColor];
    self.upTempLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.upTempLabel];
    
    UIImageView *lowerImage = [[UIImageView alloc] initWithFrame:CGRectMake(91, 49 + offSetY, 6, 14)];
    lowerImage.image = [UIImage imageNamed:@"Info_low"];
    [self addSubview:lowerImage];
    
    self.downTempLabel = [[UILabel alloc] initWithFrame:CGRectMake(106, 45 + offSetY, 40, 20)];
    self.downTempLabel.font = [UIFont systemFontOfSize:16.0f];
    self.downTempLabel.textColor = [UIColor whiteColor];
    self.downTempLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.downTempLabel];
    
    self.curTempLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 70 + offSetY, 300, 80)];
    self.curTempLabel.font = [UIFont systemFontOfSize:100.0f];
    self.curTempLabel.textColor = [UIColor whiteColor];
    self.curTempLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.curTempLabel];
}

- (void)fillViewWithDictionary:(NSDictionary *)dict
{
    _weatherView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@%@",bundleURL,@"clear_day"]];
    _weatherLabel.text=@"晴";
    _upTempLabel.text=@"18°";
    _downTempLabel.text=@"11°";
    _curTempLabel.text=@"22°";
}

@end
