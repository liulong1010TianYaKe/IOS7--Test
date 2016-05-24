//
//  Map3DViewController.m
//  IOS7-3DMap
//
//  Created by long on 5/23/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "Map3DViewController.h"
#import <MapKit/MapKit.h>

@interface Map3DViewController ()<MKMapViewDelegate>

@property (nonatomic, weak) IBOutlet MKMapView *mapView;

@end

@implementation Map3DViewController

//- (void)loadView{
//    
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"3DMap";
    
    self.mapView.delegate = self;
    // 设置地图类型： MKMapTypeStandard 显示街道和道路  MKMapTypeSatellite 显示卫星 MKMapTypeHybrid 显示混合地图
    self.mapView.mapType = MKMapTypeStandard;
    
//    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(24.148926, 113.313353);
    self.mapView.showsUserLocation = YES; //显示用户当前的坐标，打开地图有相应的提示
    
    MKCoordinateRegion theRegion;
    theRegion.center = CLLocationCoordinate2DMake(24.148926, 120.715542);
    // 定义显示范围
    theRegion.span = MKCoordinateSpanMake(10, 10);
    [self.mapView setRegion:theRegion];
    self.mapView.camera.altitude = 200;
    self.mapView.camera.pitch = 70;
    self.mapView.showsBuildings = YES;
    
    
}




@end
