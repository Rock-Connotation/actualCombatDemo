//
//  SZHBtn.m
//  btn扩大响应区域demo
//
//  Created by 石子涵 on 2022/3/29.
//

#import "SZHBtn.h"

@implementation SZHBtn

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//   //获取当前btn的bounds
//    CGRect bounds = self.bounds;
//
////    //如果热区小于指定的，则放大热区
//    CGFloat widthDelta = MAX(100 - bounds.size.width, 0);
//    CGFloat heightDelta = MAX(100 - bounds.size.height, 0);
////
//    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
////    bounds.size = CGSizeMake(100, 100);
////    bounds = CGRectMake(50, 50, 100, 100);
////    self.bounds = bounds;
//    //如果点击的点在新的热区，就返回YES
//    return  CGRectContainsPoint(bounds, point);
//}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect bounds = self.bounds;
    CGFloat widthDelta = MAX(100 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(100 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point) ? self : [super hitTest:point withEvent:event];
}
@end
