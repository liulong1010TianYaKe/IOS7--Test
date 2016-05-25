//
//  AppDelegate.m
//  IOS7-Bg
//
//  Created by long on 5/25/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor greenColor]];
    
    
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    if (version >= 8.0) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
    
//    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:10];
    
    
    /**
         MinimumBackgroundFetchInterval参数值是两次Fetch时间间隔，不能保证每隔这个时间间隔都会调用。这里设置为UIApplicationBackgroundFetchIntervalMinimum，意思是尽可能频繁的调用我们的Fetch方法
     */
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     [[UIApplication sharedApplication] setApplicationIconBadgeNumber:10];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/**
   开启后台后
   每次系统Fetch时都会调用该方法，我们可以在该方法中做刷新数据等操作，操作执行完成以后要调用completionHandlerblock()，
   比如:completionHandler(UIBackgroundFetchResultNewData);
     文档中说系统会根据completionHandler(执行的时间)来估计此次Fetch的耗电等。如果耗时耗电比较多，可能会降低被调用的次数。但这个方法也不是不限时执行的，说是有30s的时间来执行操作。completionHandler有三个参数:
 　　UIBackgroundFetchResultNewData 成功拉取数据
 　　UIBackgroundFetchResultNoData 没有新数据
 　　UIBackgroundFetchResultFailed 拉取数据失败或者超时
 
 
 */
- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler{
    
    // TODO  Fetch Data
}
@end
