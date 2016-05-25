//
//  ModeViewController.m
//  IOS7-Bg
//
//  Created by long on 5/25/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "ModeViewController.h"

@interface ModeViewController ()

@end

@implementation ModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 200, 200, 44);
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"FlipAnimationViewController" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)viewDidAppear:(BOOL)animated
{
    // Reset which view controller should be the receipient of the
    // interactor's transition
    self.interactor.presentingVC = self;
}

- (void)btnAction:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)proceedToNextViewController
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
