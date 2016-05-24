//
//  YKQRCodeReader.h
//  IOS7--QRCode
//
//  Created by long on 5/24/16.
//  Copyright © 2016 long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

//@class AVMetadataMachineReadableCodeObject;
@protocol YKQRCodeReaderDelegate <NSObject>

- (void)didDetectQRCode:(AVMetadataMachineReadableCodeObject *)qrCode;

@end

@interface YKQRCodeReader : NSObject

@property (nonatomic, weak) id<YKQRCodeReaderDelegate> delegate;
+ (instancetype)sharedReader;

- (void)startReaderOnView:(UIView*)view;
- (void)stopReader;
@end
