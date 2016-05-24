//
//  YKQRCodeCreater.m
//  IOS7--QRCode
//
//  Created by long on 5/24/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "YKQRCodeCreater.h"


@implementation YKQRCodeCreater
+ (instancetype)sharedCreater{
    
    static YKQRCodeCreater *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[YKQRCodeCreater alloc] init];
    });
    
    return _shared;
}


- (UIImage *)resizeImage:(UIImage *)image
             withQuality:(CGInterpolationQuality)quality
                    rate:(CGFloat)rate
{
    UIImage *resized = nil;
    CGFloat width = image.size.width * rate;
    CGFloat height = image.size.height * rate;
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, quality);
    [image drawInRect:CGRectMake(0, 0, width, height)];
    resized = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resized;
}
#pragma mark -------------------
#pragma mark - Public Method
- (UIImage *)createQRCodeImage:(NSString* )qrString{
    
  
    if (!qrString || [qrString isEqualToString:@""]) {
        return nil;
    }
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    //    NSLog(@"filterAttributes:%@", filter.attributes);
    
    [filter setDefaults];
    
    NSData *data = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    
    CIImage *outputImage = [filter outputImage];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:outputImage
                                       fromRect:[outputImage extent]];
    
    UIImage *image = [UIImage imageWithCGImage:cgImage
                                         scale:1.
                                   orientation:UIImageOrientationUp];
    
    // Resize without interpolating
    UIImage *resized = [self resizeImage:image
                             withQuality:kCGInterpolationNone
                                    rate:5.0];
    
//    self.imageView.image = resized;
    
    CGImageRelease(cgImage);
    return resized;
}
@end
