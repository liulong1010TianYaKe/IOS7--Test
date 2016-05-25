//
//  FadeTransition.m
//  IOS7-Bg
//
//  Created by long on 5/25/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "FadeTransition.h"

@implementation FadeTransition

// 系统给出一个切换上下文，我们根据上下文环境返回这个切换所需要的花费时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 2.0;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;

    
//    [containerView addSubview:fromVC.view];
    [containerView addSubview:toVC.view];
    toVC.view.alpha = 0.0;
    
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
//        toVC.view.alpha = 1.0f;
//    } completion:^(BOOL finished) {
//        [fromVC.view removeFromSuperview];
//        [transitionContext completeTransition:YES];
//    }];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromVC.view.transform = CGAffineTransformMakeTranslation(-320, 0);
        toVC.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        fromVC.view.transform = CGAffineTransformIdentity;
        // 声明过渡结束-->记住，一定别忘了在过渡结束时调用 completeTransition: 这个方法
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    

    
}

@end
