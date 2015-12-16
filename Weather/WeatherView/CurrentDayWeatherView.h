//
//  CurrentDayWeatherView.h
//  Weather
//
//  Created by 朱江 on 15/12/16.
//  Copyright © 2015年 all. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrentDayWeatherView : UIView

@property (nonatomic, strong) UIImageView *weatherView;
@property (nonatomic, strong) UILabel *weatherLabel;
@property (nonatomic, strong) UILabel *upTempLabel;
@property (nonatomic, strong) UILabel *downTempLabel;
@property (nonatomic, strong) UILabel *curTempLabel;

- (void)createView;
- (void)fillViewWithDictionary:(NSDictionary *)dict;    
@end
