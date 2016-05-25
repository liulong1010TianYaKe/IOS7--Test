//
//  FlipAnimation.h
//  IOS7-Bg
//
//  Created by long on 5/25/16.
//  Copyright © 2016 long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FlipAnimation : NSObject  <UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) BOOL dismissal;
@end
