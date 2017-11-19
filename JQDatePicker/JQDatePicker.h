//
//  JQDatePicker.h
//  UIPickView解析
//
//  Created by 韩军强 on 2017/11/19.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectBlock)(NSString *selectTime);

@interface JQDatePicker : UIDatePicker

/**
    自定义选中日期的格式：
     @"yyyy-MM-dd HH:mm:ss"、
     @"yyyy-MM-dd"、
     @"HH:mm:ss"
*/
@property (nonatomic, strong) NSString *dateFormat;

-(instancetype)jq_initWithFrame:(CGRect)frame selectCurrentTime:(SelectBlock)selectBlock;

@end
