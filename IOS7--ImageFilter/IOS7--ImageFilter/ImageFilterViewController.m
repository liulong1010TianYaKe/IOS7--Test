//
//  ImageFilterViewController.m
//  IOS7--ImageFilter
//
//  Created by long on 5/23/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "ImageFilterViewController.h"
#import <CoreImage/CoreImage.h>


@interface ImageFilterViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, weak) IBOutlet UIImageView *imgView;
@property (nonatomic, weak) IBOutlet UIPickerView *pickerView;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) UIImage *orgImage;
@end

@implementation ImageFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.orgImage = [UIImage imageNamed:@"sample.jpg"];
    self.imgView.image = self.orgImage;
    
    
     NSArray *tempArr = @[@"原始图片",
                   //                   @"CIBlendWithAlphaMask",
                   //                   @"CIColorClamp",
                   //                   @"CIColorCrossPolynomial",
                   //                   @"CIColorCubeWithColorSpace",
                   //                   @"CIColorPolynomial",
                   //                   @"CIConvolution3X3",
                   //                   @"CIConvolution5X5",
                   //                   @"CIConvolution7X7",
                   //                   @"CIConvolution9Horizontal",
                   //                   @"CIConvolution9Vertical",
                   @"CILinearToSRGBToneCurve",
                   @"CIPhotoEffectChrome",
                   @"CIPhotoEffectFade",
                   @"CIPhotoEffectInstant",
                   @"CIPhotoEffectMono",
                   @"CIPhotoEffectNoir",
                   @"CIPhotoEffectProcess",
                   @"CIPhotoEffectTonal",
                   @"CIPhotoEffectTransfer",
                   @"CISRGBToneCurveToLinear",
                   @"CIVignetteEffect",
                   ];
    self.items = [NSMutableArray arrayWithArray:tempArr];
    
    
    // 获取系统滤镜的列表
    NSArray *filterName = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    NSLog(@"%@",filterName);
//    NSMutableArray *temp = [NSMutableArray arrar];
//    [self.items addObjectsFromArray:filterName];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -------------------
#pragma mark - UIPickerViewDataSource ,UIPickerViewDelegate


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.items.count;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return self.items[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (row == 0) {
        
        self.imgView.image = self.orgImage;
        
        return;
    }
    
    // 导入CIImage图片
    CIImage *ciImage = [[CIImage alloc] initWithImage:self.orgImage];


    
    //  创建出Filter滤镜
    CIFilter *filter = [CIFilter filterWithName:self.items[row]
                                  keysAndValues:kCIInputImageKey, ciImage, nil];
    [filter setDefaults];
    
     // 用CIContext将滤镜中图片渲染出来
    CIContext *context = [CIContext contextWithOptions:nil];
//    CIImage *outputImage = [filter outputImage];
    CIImage *outputImage = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:outputImage
                                       fromRect:[outputImage extent]];
   // 导出图片
    UIImage  *image = [UIImage imageWithCGImage:cgImage];

    CGImageRelease(cgImage);
    
    self.imgView.image  = image;
}


- (void)test{
    CIColor *ciColor = [[CIColor alloc] initWithColor:[UIColor redColor]];
    CIImage *ciImage = [CIImage imageWithColor:ciColor];
    
    UIImage *image =  [[UIImage alloc ] initWithCIImage:ciImage];
    self.imgView.image = image;
}
@end
