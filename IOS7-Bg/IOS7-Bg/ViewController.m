//
//  ViewController.m
//  IOS7-Bg
//
//  Created by long on 5/25/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "ViewController.h"

@import SafariServices;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    
    
    if ([SSReadingList supportsURL:[NSURL URLWithString:@"https://www.baidu.com/index.php?tn=monline_3_dg"]]) {
        SSReadingList *readingList = [SSReadingList defaultReadingList];
        NSError *error;
        [readingList addReadingListItemWithURL:[NSURL URLWithString:@"https://www.baidu.com/index.php?tn=monline_3_dg"] title:@"baidu" previewText:@"baidu shou ye" error:&error];
        if(error) {
            NSLog(@"There was a problem adding to a reading list");
        } else {
            NSLog(@"Successfully added to reading list");
        }
    }
   
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self setNeedsStatusBarAppearanceUpdate];
}


- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden{
    return NO;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return UIStatusBarAnimationFade;
}



@end
