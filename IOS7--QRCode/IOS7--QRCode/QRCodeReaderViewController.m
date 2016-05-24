//
//  QRCodeReaderViewController.m
//  IOS7--QRCode
//
//  Created by long on 5/24/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "QRCodeReaderViewController.h"
#import "YKQRCodeReader.h"
#import "SVProgressHUD.h"

@interface QRCodeReaderViewController ()<YKQRCodeReaderDelegate>

@end

@implementation QRCodeReaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:view];
    view.layer.borderColor = [UIColor redColor].CGColor;
    view.layer.borderWidth = 1;
    view.layer.masksToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [[YKQRCodeReader sharedReader] setDelegate:self];
    [[YKQRCodeReader sharedReader] startReaderOnView:view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------------------
#pragma mark - YKQRCodeReaderDelegate
- (void)didDetectQRCode:(AVMetadataMachineReadableCodeObject *)qrCode {
    
    NSString *msg = [NSString stringWithFormat:@"Detected a QR code! type:%@, value:%@",
                     qrCode.type, qrCode.stringValue];
    [SVProgressHUD showSuccessWithStatus:msg];
}


@end
