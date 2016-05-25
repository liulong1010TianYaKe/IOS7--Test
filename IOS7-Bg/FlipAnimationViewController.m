//
//  FlipAnimationViewController.m
//  IOS7-Bg
//
//  Created by long on 5/25/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "FlipAnimationViewController.h"
#import "FlipAnimation.h"
#import "FlipAnimationInteractor.h"
#import "ModeViewController.h"

@interface FlipAnimationViewController ()<FlipInteractiveTransitionViewControllerDelegate,UIViewControllerTransitioningDelegate>
@property (nonatomic, strong)  FlipAnimation *flipAnimation;
@property (nonatomic, strong) FlipAnimationInteractor *flipAnimationInteractor;

@end

@implementation FlipAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.flipAnimation = [[FlipAnimation alloc] init];
    self.flipAnimationInteractor  = [[FlipAnimationInteractor alloc] init];
    self.view.backgroundColor = [UIColor brownColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 200, 200, 44);
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"FlipAnimationViewController" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated
{
    // Add the gesture recogniser to the window first render time
    if (![self.view.window.gestureRecognizers containsObject:self.flipAnimationInteractor.gestureRecogniser]) {
        [self.view.window addGestureRecognizer:self.flipAnimationInteractor.gestureRecogniser];
    }
    // Set the recipeint of the interactor
    self.flipAnimationInteractor.presentingVC = self;
}

- (void)btnAction:(UIButton *)btn{
    ModeViewController *VC = [[ModeViewController alloc] init];
//    [VC pe]
    VC.transitioningDelegate = self;
    VC.interactor = self.flipAnimationInteractor;
//    [self.navigationController pushViewController:VC animated:YES];
    [self presentViewController:VC animated:YES completion:nil];
}
- (void)proceedToNextViewController{
//    [self performSegueWithIdentifier:@"displayModal" sender:self];
    
}
#pragma mark -------------------
#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    self.flipAnimation.dismissal = NO;
    return _flipAnimation;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.flipAnimation.dismissal = YES;
    return _flipAnimation;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator{
    return self.flipAnimationInteractor.interactionInProgress ? _flipAnimationInteractor : nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
      return self.flipAnimationInteractor.interactionInProgress ? _flipAnimationInteractor : nil;
}
@end
