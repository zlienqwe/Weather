//
//  WeatherHeaderView.m
//  Weather
//
//  Created by 朱江 on 15/12/16.
//  Copyright © 2015年 all. All rights reserved.
//

#import "WeatherHeaderView.h"

@implementation WeatherHeaderView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.backBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 10, 24, 24)];
    [self.backBtn setImage:[UIImage imageNamed:@"back_btn"] forState:UIControlStateNormal];
    [self addSubview:self.backBtn];

    self.refreshBtn = [[UIButton alloc] initWithFrame:CGRectMake(281, 10, 24, 24)];
    [self.refreshBtn setImage:[UIImage imageNamed:@"refresh_btn"] forState:UIControlStateNormal];
    [self addSubview:self.refreshBtn];

    UILabel *cityLabel = [[UILabel alloc] initWithFrame:CGRectMake((frame.size.width - 200.0f) / 2.0f, 4, 200, 20)];
    cityLabel.font = [UIFont systemFontOfSize:17.0f];
    cityLabel.textColor = [UIColor whiteColor];
    cityLabel.backgroundColor = [UIColor clearColor];
    cityLabel.textAlignment = NSTextAlignmentCenter;
    cityLabel.text = @"西安";
    [self addSubview:cityLabel];

    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake((frame.size.width - 200.0f) / 2.0f, 24, 200, 16)];
    dateLabel.font = [UIFont systemFontOfSize:14.0f];
    dateLabel.textColor = [UIColor whiteColor];
    dateLabel.backgroundColor = [UIColor clearColor];
    dateLabel.textAlignment = NSTextAlignmentCenter;
    dateLabel.text = @"2015年12月1日 星期日";
    [self addSubview:dateLabel];
  }
  return self;
}

@end
