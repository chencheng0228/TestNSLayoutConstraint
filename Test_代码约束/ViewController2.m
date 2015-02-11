//
//  ViewController2.m
//  Test_代码约束
//
//  Created by admin on 15-1-23.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];

    
     NSMutableArray *myConstraints = [NSMutableArray array];
     UIButton *button1 = [[UIButton alloc] init];
    //首先我们要明确，当我们使用自动布局的时候为了不让Contraint和view本身的autoresize属性发生冲突，我们首先需要把控件 的属性设为setTranslatesAutoresizingMaskIntoConstraints:NO
    button1.translatesAutoresizingMaskIntoConstraints = NO;
    button1.backgroundColor = [UIColor redColor];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] init];
    button2.translatesAutoresizingMaskIntoConstraints = NO;
    button2.backgroundColor = [UIColor brownColor];
    [self.view addSubview:button2];
    
     //将button1的高度设置为当前view高度的0.3倍
     NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.3 constant:0];
    
     //设置这个属性的目的是为了，接下来有一个新的需求，在横向的显示中，Button的高度太短了，所以要求Button的最 小高度为150 这样的话，需要加入另一个限制大小的Constraint，但是这两个Constraint在某些情况下是有冲突的，我们可以通过设置Constraint的优先级来解决。优先级对应NSLayoutConstraint类型的priority属性，默认值是UILayoutPriorityRequired，数值上等于1000. 设置一个低的值代表更低的优先级
      constraint1.priority = UILayoutPriorityDefaultHigh;
    
    
    //button1的top距离button2的bottom是100.。
    //疑问为什么multiplier参数要填1呢，填写其他数字距离就不准确
    
     NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:button2 attribute:NSLayoutAttributeBottom multiplier:1 constant:100];
    
    
    //button1的left边距离self.view的left边的距离是100.。...............
     NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:100];
    
    
    //原先button的高度是view的0.3倍，为了在横屏的情况下可以显示的更长，在这里就将button的最低高度设为150，这样在横屏的情况下如果view的高度的0.3倍小鱼150，就取值为150
     NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:button1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:150];
    
    //将约束添加上有2中方法
    //方法一
    //   [self.view addConstraint:constraint1];
    //    [self.view addConstraint:constraint2];
    //    [self.view addConstraint:constraint3];
    //    [self.view addConstraint:constraint4];
    
    //方法二
     [myConstraints addObject:constraint1];
     [myConstraints addObject:constraint2];
     [myConstraints addObject:constraint3];
     [myConstraints addObject:constraint4];
     [NSLayoutConstraint activateConstraints:myConstraints];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
