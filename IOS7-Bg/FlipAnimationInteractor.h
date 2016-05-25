//
//  FlipAnimationInteractor.h
//  IOS7-Bg
//
//  Created by long on 5/25/16.
//  Copyright © 2016 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FlipInteractiveTransitionViewControllerDelegate <NSObject>

- (void)proceedToNextViewController;

@end

@interface FlipAnimationInteractor : UIPercentDrivenInteractiveTransition

@property (nonatomic, strong, readonly) UIPanGestureRecognizer *gestureRecogniser;
@property (nonatomic, assign, readonly) BOOL interactionInProgress;

@property (nonatomic, weak) UIViewController<FlipInteractiveTransitionViewControllerDelegate> *presentingVC;
@end
