//
//  ViewController.m
//  IOS7-DynamicBehavors
//
//  Created by long on 5/23/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator; //UIKit的动态特性

@property (nonatomic, strong) UIGravityBehavior *gravityBeahvior; // 重力


@property (nonatomic, strong) UICollisionBehavior *collisionBehavior; // 碰撞
@property (nonatomic, strong)  UIDynamicItemBehavior *itemBehavior; 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:gesture];
    
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.gravityBeahvior = [[UIGravityBehavior alloc] init];
//    self.gravityBeahvior.angle  = 20;
    self.collisionBehavior = [[UICollisionBehavior alloc] init];
    self.collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    self.collisionBehavior.collisionMode = UICollisionBehaviorModeEverything;
    
    self.itemBehavior = [[UIDynamicItemBehavior alloc] init]; // 动力动画
    self.itemBehavior.elasticity = 0.5; // 设置碰撞弹性系数(0.0-1.0)
    self.itemBehavior.friction = 0.5;  //设置摩擦系数
    self.itemBehavior.resistance = 0.5; // 设置线性阻力系数
    self.itemBehavior.angularResistance = 1; // 设置角度阻力系数
    self.itemBehavior.density = 2; //  设置相对密度
    
    /*
     
     注意： 如果向同一个动力动画添加多个UIDynamicItemBehavior实例，只会应用一套属性描述(交集？)多个UIDynamicItemBehavior实例配置同个属性时，使用最后的。
     
     – addAngularVelocity:forItem:向dynamic item增加角速度属性。单位弧度
     – addLinearVelocity:forItem: 向dynamic item增加线速度属性。单位点
     angularResistance  property         UIDynamicItemBehavior的角度阻力系数。
     
     **/
    
    
    [self.animator addBehavior:self.gravityBeahvior];
    [self.animator addBehavior:self.collisionBehavior];
    [self.animator addBehavior:self.itemBehavior];
    
}




- (void)tapped:(UITapGestureRecognizer *)gesture{
    
    NSUInteger num = arc4random() % 40 + 1;
    NSString *fileName = [NSString stringWithFormat:@"m%lu",num];
    UIImage *image = [UIImage imageNamed:fileName];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imgView];
    
    CGPoint tapPoint = [gesture locationInView:gesture.view];
    imgView.center = tapPoint;
    
    [self.gravityBeahvior addItem:imgView];
    [self.collisionBehavior addItem:imgView];
    [self.itemBehavior addItem:imgView];
    
}

@end
