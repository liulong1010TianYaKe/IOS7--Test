//
//  ModeViewController.h
//  IOS7-Bg
//
//  Created by long on 5/25/16.
//  Copyright © 2016 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlipAnimationInteractor.h"


@interface ModeViewController : UIViewController<FlipInteractiveTransitionViewControllerDelegate>
@property (nonatomic, weak) FlipAnimationInteractor *interactor;
@end
