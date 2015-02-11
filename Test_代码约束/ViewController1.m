//
//  ViewController1.m
//  Test_代码约束
//
//  Created by admin on 15-2-10.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import "ViewController1.h"

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
     NSMutableArray *myConstraints = [NSMutableArray array];
    
    
    UIButton *button1 = [[UIButton alloc] init];
    button1.backgroundColor = [UIColor redColor];
    
    
    UIButton *button2 = [[UIButton alloc] init];
    button2.backgroundColor = [UIColor blackColor];
    
    //button1和button2 将使用AutoLayout的方式来布局
    button1.translatesAutoresizingMaskIntoConstraints = NO;
    button2.translatesAutoresizingMaskIntoConstraints = NO;
    
    //值得注意的是,添加约束之前一定要将子视图优先addSubview到父视图中,否则在添加约束时会产生编译器警告.
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    
    
    //创建需要参与约束规则的对象字典
    NSDictionary *viewsDictionary =
    NSDictionaryOfVariableBindings(button1, button2);
    NSDictionary *viewsDictionary2 =
    NSDictionaryOfVariableBindings(button1);
    
    //竖直方向的约束。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
     NSArray *constraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[button1(==100)]"
                                            options:NSLayoutFormatAlignAllTop metrics:nil views:viewsDictionary2];
    //水平方向的约束。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
     NSArray *constraints2 =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[button1(==100)][button2(==100)]-50-|"
                                            options:NSLayoutFormatAlignAllTop metrics:nil views:viewsDictionary];
    
    [myConstraints addObjectsFromArray:constraints];
    [myConstraints addObjectsFromArray:constraints2];
    
    
    [NSLayoutConstraint activateConstraints:myConstraints];
     //与activateConstraints功能相反。。。。。。。 就是 remove the existing constraints
     // [NSLayoutConstraint deactivateConstraints:self.constraints]
    
//    [self.view addConstraints:constraints];
//    [self.view addConstraints:constraints2];
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
