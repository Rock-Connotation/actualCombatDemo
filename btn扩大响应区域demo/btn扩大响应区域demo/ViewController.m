//
//  ViewController.m
//  btn扩大响应区域demo
//
//  Created by 石子涵 on 2022/3/29.
//

#import "ViewController.h"
#import "SZHBtn.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SZHBtn *btn = [[SZHBtn alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(200, 50, 50, 50)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    // Do any additional setup after loading the view.
}
- (void)test{
    NSLog(@"已经点击");
}

@end
