//
//  ViewController.m
//  ARC验证
//
//  Created by 石子涵 on 2022/4/19.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()
@property (nonatomic, copy, nonnull) NSMutableArray *ary;
@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    for (int i = 0; i < 100; i++) {
        printf("1");
        dispatch_async(dispatch_get_global_queue(0, 0), ^{ // 如果把这里改成globalQueue，又会输出什么
            printf("2");
        });
        printf("3");
        printf("\n");
    }
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.btn = btn;
    
}
- (void)test{
    //获取成员变量列表
    unsigned count = 0;
    Ivar *ivars = class_copyIvarList([self.view class], &count);
    for (int i = 0; i < count; i++) {
        Ivar *ivar = *(ivars + i);
        
//        NSLog(@"%s", ivar_getName(ivar));
        printf("%s \n", ivar_getName(ivar));
    }
    free(ivars);
    NSLog(@"%@----1", self.view.nextResponder);
//    [self.view setValue:self.btn forKey:@"nextResponder"];
//    NSLog(@"%@----2", self.view.nextResponder);
//    [self.view setValue:self forKey:@"nextResponder"];
//    NSLog(@"%@----3", self.view.nextResponder);
}

@end
