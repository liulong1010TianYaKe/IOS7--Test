//
//  MapSnapshotViewController.m
//  IOS7-3DMap
//
//  Created by long on 5/23/16.
//  Copyright © 2016 Hzins. All rights reserved.
//

#import "MapSnapshotViewController.h"
#import <MapKit/MapKit.h>
#import "SVProgressHUD.h"

@interface MapSnapshotViewController ()

@property (nonatomic, strong) MKMapView *mapView;

@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation MapSnapshotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 250)];
    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(37.78275123, -122.40416442);
    self.mapView.camera.altitude = 200;
    self.mapView.camera.pitch = 70;
    self.mapView.showsBuildings = YES;
    [self.view addSubview:self.mapView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Create a Sponhhot" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(50, 250, 200, 50);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(createShonShotAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 350, 200, 200)];
    [self.view addSubview:self.imgView];
    
    
}


- (void)createShonShotAction:(UIButton *)btn{
    
    [SVProgressHUD showWithStatus:@"Creating a screenshot..."
                         maskType:SVProgressHUDMaskTypeGradient];
    
    MKMapSnapshotOptions *options = [[MKMapSnapshotOptions alloc] init];
    options.size = CGSizeMake(512, 512);
    options.scale = [[UIScreen mainScreen] scale];
    options.camera = self.mapView.camera;
    options.mapType = MKMapTypeStandard;
    
    MKMapSnapshotter *snapshotter = [[MKMapSnapshotter alloc] initWithOptions:options];
    [snapshotter startWithCompletionHandler:^(MKMapSnapshot *snapshot, NSError *e)
     {
         if (e) {
             NSLog(@"error:%@", e);
         }
         else {
             
             [SVProgressHUD showSuccessWithStatus:@"done!"];
             
             self.imgView.image = snapshot.image;
         }
     }];
    
}

@end
