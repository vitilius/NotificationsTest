//
//  AppDelegate.m
//  NotificationsTest
//
//  Created by Viktor Lukashevich on 25.02.16.
//  Copyright © 2016 Viktar Lukashevich. All rights reserved.
//

#import "AppDelegate.h"
#import "VLSubclasses.h"
#import "VLGovernment.h"

@interface AppDelegate ()
@property (strong, nonatomic) VLGovernment* government;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.government = [[VLGovernment alloc] init];
    
    VLDoctor *doctor = [[VLDoctor alloc] init];
    VLPensioner *pensioner = [[VLPensioner alloc] init];
    VLBusinessman *businessman = [[VLBusinessman alloc] init];
    
    doctor.averagePrice = businessman.averagePrice = pensioner.averagePrice = self.government.averagePrice;
    doctor.salary = businessman.salary = self.government.salary;
    businessman.taxLevel = self.government.taxLevel;
    pensioner.pension = self.government.pension;
    
    self.government.taxLevel = .20f;
    self.government.salary = 1100.f;
    self.government.pension = 550.f;
    self.government.averagePrice = 15.f;
    NSLog(@"\n");
    self.government.taxLevel = .08f;
    self.government.salary = 1200.f;
    self.government.pension = 600.f;
    self.government.averagePrice = 12.f;
    


    
    
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
