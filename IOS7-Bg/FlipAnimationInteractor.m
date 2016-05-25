//
//  FlipAnimationInteractor.m
//  IOS7-Bg
//
//  Created by long on 5/25/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "FlipAnimationInteractor.h"


@interface FlipAnimationInteractor ()
@property (nonatomic, strong, readwrite) UIPanGestureRecognizer *gestureRecogniser;
@property (nonatomic, assign, readwrite) BOOL interactionInProgress;
@end

@implementation FlipAnimationInteractor

- (instancetype)init
{
    self = [super init];
    if (self) {
          self.gestureRecogniser = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    }
    return self;
}


#pragma mark -------------------
#pragma mark -  Gesture recognition

- (void)handlePan:(UIPanGestureRecognizer *)pgr
{
    CGPoint translation = [pgr translationInView:pgr.view];
    CGFloat percentage  = fabs(translation.y / CGRectGetHeight(pgr.view.bounds));
    switch (pgr.state) {
        case UIGestureRecognizerStateBegan:
            self.interactionInProgress = YES;
            [self.presentingVC proceedToNextViewController];
            break;
            
        case UIGestureRecognizerStateChanged: {
            [self updateInteractiveTransition:percentage];
            break;
        }
            
        case UIGestureRecognizerStateEnded:
            if(percentage < 0.5) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            self.interactionInProgress = NO;
            break;
            
        case UIGestureRecognizerStateCancelled:
            [self cancelInteractiveTransition];
            self.interactionInProgress = NO;
            
        default:
            break;
    }
}

@end
