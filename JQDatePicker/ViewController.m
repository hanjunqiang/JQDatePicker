//
//  ViewController.m
//  JQDatePicker
//
//  Created by 韩军强 on 2017/11/19.
//  Copyright © 2017年 韩军强. All rights reserved.
//

#import "ViewController.h"
#import "JQDatePicker.h"
@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) JQDatePicker *datePicker;
@property (nonatomic, strong) UITextField *textfield;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    self.textfield = textfield;
    
    textfield.delegate = self;
    textfield.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:textfield];
    
    
    JQDatePicker *datePicker = [[JQDatePicker alloc] jq_initWithFrame:CGRectMake(0, 300, 0, 0) selectCurrentTime:^(NSString *selectTime) {
        
        NSLog(@"selectTime---%@",selectTime);
        self.textfield.text = selectTime;
        
    }];
    self.datePicker = datePicker;
//    datePicker.dateFormat = @"HH:mm:ss";
    textfield.inputView = datePicker;

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textfield resignFirstResponder];
    [self.datePicker removeFromSuperview];
}

// 是否允许用户输入文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return NO;
}

// 文本框开始编辑的时候调用
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    // 给生日文本框赋值
    [self dateChange:_datePicker];
}

// 当UIDatePicker滚动的时候调用
// 给生日文本框赋值
- (void)dateChange:(UIDatePicker *)datePicker
{
    NSLog(@"%@",datePicker.date);
    // 日期转换字符串
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSString *dateStr = [fmt stringFromDate:datePicker.date];
    
    self.textfield.text = dateStr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
