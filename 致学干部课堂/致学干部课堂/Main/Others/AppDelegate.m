//
//  AppDelegate.m
//  致学在线
//
//  Created by zhixue on 15/4/29.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "AppDelegate.h"
#import "ZXAccount.h"
#import "ZXAccountTool.h"
#import "ZXLoginVC.h"
#import "ZXCustomNavigation.h"
#import "ZXNewFeatureVC.h"
#import "ZXTabBarVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    NSString *key = @"CFBundleVersion";
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:kBundleVersion];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[kBundleVersion];
    
    if ([currentVersion isEqualToString:lastVersion])
    {
        ZXTabBarVC *tabBarVC = [[ZXTabBarVC alloc] init];
        self.window.rootViewController = tabBarVC;
        [tabBarVC showLogin];
    }else
    {
        self.window.rootViewController = [[ZXNewFeatureVC alloc] init];
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    //    //    解决 Attempting to badge the application icon but haven't received permission from the user to badge the application
    //    float sysVersion=[[UIDevice currentDevice]systemVersion].floatValue;
    //    if (sysVersion>=8.0)
    //    {
    //        UIUserNotificationType type = UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound;
    //        UIUserNotificationSettings *setting=[UIUserNotificationSettings settingsForTypes:type categories:nil];
    //        [[UIApplication sharedApplication]registerUserNotificationSettings:setting];
    //    }
    
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBarTintColor:color(235, 67, 67)];
    bar.translucent = NO;
    [bar setTintColor:[UIColor whiteColor]];
    sleep(1);
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
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
