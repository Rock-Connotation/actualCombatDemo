//
//  ViewController.m
//  让两个view响应一个事件
//
//  Created by 石子涵 on 2022/4/13.
//

#import "ViewController.h"
#import "SZHBtn.h"
@interface ViewController ()
@property (nonatomic, strong) SZHBtn *redBtn;
@property (nonatomic, strong) UIButton *blueBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.redBtn];
    [self.view addSubview:self.blueBtn];
//    self.redBtn.frame = self.blueBtn.frame;
    
    
//    self.redBtn.blueBtn = self.blueBtn;
//    NSLog(@"%@\n, %@\n, %@\n", self.blueBtn.superview, self.redBtn.superview, self.view.superview);
}
- (void)test1{
    NSLog(@"red ---- test");
}

- (void)test2{
    NSLog(@"blue --- test");
}
- (SZHBtn *)redBtn{
    if (!_redBtn){
        SZHBtn *btn = [[SZHBtn alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        [btn addTarget:self action:@selector(test1) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor redColor];
        _redBtn = btn;
    }
    return _redBtn;
}

- (UIButton *)blueBtn{
    if (!_blueBtn){
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        [btn addTarget:self action:@selector(test2) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor blueColor];
        _blueBtn = btn;
    }
    return _blueBtn;
}



@end
