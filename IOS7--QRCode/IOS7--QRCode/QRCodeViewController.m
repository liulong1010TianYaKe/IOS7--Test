//
//  QRCodeViewController.m
//  IOS7--QRCode
//
//  Created by long on 5/24/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "QRCodeViewController.h"

#import "YKQRCodeCreater.h"

@interface QRCodeViewController ()

@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    [self.view addSubview:imgView];
    
    imgView.image = [[YKQRCodeCreater sharedCreater] createQRCodeImage:@"https://hzins.com"];
    
}




@end
