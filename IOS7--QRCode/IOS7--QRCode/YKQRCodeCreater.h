//
//  YKQRCodeCreater.h
//  IOS7--QRCode
//
//  Created by long on 5/24/16.
//  Copyright © 2016 long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface YKQRCodeCreater : NSObject

+ (instancetype )sharedCreater;

/**
 *  生成二维码
 *
 *  @param qrString 用于生成二维码的字符串
 *
 *  @return 返回二维码图片
 */
- (UIImage *)createQRCodeImage:(NSString* )qrString;

@end
