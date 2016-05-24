//
//  SpringAnimationViewController.m
//  IOS7--Animation
//
//  Created by long on 5/24/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "SpringAnimationViewController.h"

@interface SpringAnimationViewController ()
{
    CGPoint orgPos;
    CGPoint targetPos;
}

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *paramLabel1;
@property (nonatomic, weak) IBOutlet UILabel *paramLabel2;
@property (nonatomic, weak) IBOutlet UISlider *paramSlider1;
@property (nonatomic, weak) IBOutlet UISlider *paramSlider2;
- (IBAction)startAnimationAction:(id)sender;
@end

@implementation SpringAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    orgPos = self.imageView.center;
//    targetPos = CGPointMake(orgPos.x + 240, orgPos.y);
    
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    orgPos = self.imageView.center;
    targetPos = CGPointMake(orgPos.x + 240, orgPos.y);
    
    [self updateLabels];
    
}


- (IBAction)sliderChanged:(UISlider *)sender {
    
    [self updateLabels];
}
- (void)updateLabels {
    
    self.paramLabel1.text = [NSString stringWithFormat:@"%.2f", self.paramSlider1.value];
    self.paramLabel2.text = [NSString stringWithFormat:@"%.2f", self.paramSlider2.value];
}



- (IBAction)startAnimationAction:(UIButton *)sender {
    sender.enabled = NO;
    
    self.imageView.center  = orgPos;
    
    /**  弹簧的运动描述的时间曲线的动画
      dampingRatio 当阻尼系数为1，动画将平稳减速到其最终价值模型没有振荡。阻尼系数小于1，将产生越来越多的在来完全停止
     velocity  速度 如果 为1 即为1秒移动总动画距离
     
     
     */
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:self.paramSlider1.value initialSpringVelocity:self.paramSlider2.value options:UIViewAnimationOptionRepeat animations:^{
        self.imageView.center = targetPos;
    } completion:^(BOOL finished) {
        sender.enabled = YES;
    }];
    
}
@end
