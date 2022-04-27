//
//  ViewController.m
//  MRC使用
//
//  Created by 石子涵 on 2022/4/19.
//

#import "ViewController.h"

@interface ViewController (){
    NSObject *_obj;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSArray *ary = [[NSArray alloc] init];
//    NSArray *ary2 = [ary copy];
//    NSLog(@"%lu", (unsigned long)[ary retainCount]) ;
//    [ary release];
//    [ary autorelease];
    
//    [obj release];
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    [pool autorelease];
    id obj = [[NSObject alloc] init];
    [obj autorelease]; //等同于：[NSAutoreleasePool addObject: obj];
    NSLog(@"%@", obj);
//    [pool drain];   //销毁自动释放池:等同于[pool release];
    NSLog(@"%@", obj);
    
}

- (void)test{
    NSLog(@"%p", _obj);
}

//- (void)dealloc{
//
//    [super dealloc];
//}

@end
