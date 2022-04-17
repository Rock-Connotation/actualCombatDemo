//
//  ViewController.m
//  FMDB使用
//
//  Created by 石子涵 on 2022/4/8.
//

#import "ViewController.h"
#import "DBManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%p\n %p", [DBManager shareInstance], [[DBManager alloc] init]);
    // Do any additional setup after loading the view.
}


@end
