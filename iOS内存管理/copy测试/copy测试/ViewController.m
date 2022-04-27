//
//  ViewController.m
//  copy测试
//
//  Created by 石子涵 on 2022/4/18.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, copy) NSArray *ary1;
@property (nonatomic, strong) NSArray *ary2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *mutAry =[@[@1,@2] mutableCopy];
    self.ary1 = mutAry;
    
    self.ary2 = mutAry;
    [mutAry addObject:@3];
    
}

- (void)setAry1:(NSArray *)ary1{
    _ary1 = [ary1 copy];
}

@end
