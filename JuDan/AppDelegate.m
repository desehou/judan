//
//  AppDelegate.m
//  JuDan
//
//  Created by desehou on 2017/10/17.
//  Copyright © 2017年 JuDanMall. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "CategoryViewController.h"
#import "PurchaseViewController.h"
#import "SearchViewController.h"
#import "MeViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    
    HomeViewController *home = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:home];
    CategoryViewController *category = [[CategoryViewController alloc] init];
    UINavigationController *categoryNav = [[UINavigationController alloc] initWithRootViewController:category];
    
    PurchaseViewController *purchase = [[PurchaseViewController alloc] init];
    UINavigationController *purchaseNav = [[UINavigationController alloc] initWithRootViewController:purchase];
    
    
    SearchViewController *search=[[SearchViewController alloc]init];
    UINavigationController *searchNav = [[UINavigationController alloc] initWithRootViewController:search];
    
    
    MeViewController *me = [[MeViewController alloc] init];
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:me];
    
    tabbar.tabBar.tintColor = WS_RGB(217, 96, 86);
    [tabbar setViewControllers:@[homeNav,categoryNav,purchaseNav,searchNav,meNav]];
    
    UITabBarItem*item0= [tabbar.tabBar.items objectAtIndex:0];
    
    UITabBarItem*item1= [tabbar.tabBar.items objectAtIndex:1];
    
    UITabBarItem*item2= [tabbar.tabBar.items objectAtIndex:2];
    
    UITabBarItem*item3= [tabbar.tabBar.items objectAtIndex:3];
    
    UITabBarItem*item4= [tabbar.tabBar.items objectAtIndex:4];
    
    item0.image = [UIImage imageNamed:@"home_icon"];
    item0.title = @"首页";
    item1.image = [UIImage imageNamed:@"category_icon"];
    item1.title = @"类别";
    item2.image = [UIImage imageNamed:@"purchase_icon"];
    item2.title =@"采购";
    item3.image = [UIImage imageNamed:@"search_icon"];
    item3.title =@"搜索";
    item4.image = [UIImage imageNamed:@"me_icon"];
    item4.title =@"我的";
    
    
    /*
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline] fontWithSize:17.]}];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setBackgroundImage:[WSTool imageWithColor:WS_RGB(255, 255, 255) andHeight:1.0] forBarMetrics:UIBarMetricsDefault];
     */
 
    
    
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window setRootViewController:tabbar];
    [self.window makeKeyAndVisible];
    
    
    
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
