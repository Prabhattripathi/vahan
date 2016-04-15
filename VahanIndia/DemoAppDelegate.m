//
//  DemoAppDelegate.m
//  VahanIndia
//
//  Created by geniemac4 on 26/03/15.
//  Copyright (c) 2015 genie. All rights reserved.
//

#import "DemoAppDelegate.h"

@implementation DemoAppDelegate

@synthesize price_id,brand_id,fuel_id,BodyType_id,cardealer_id,carserviceStn_id,colormodel_id,review_id,priceDetailed_id,CarImage,CarName,CarPrice,CarKMPL,NewsDetailTITLE,NewsDetailSTARTDATE,NewsDetailIMAGE,NewsDetailLONGDESCRP,NewsDetailUSERNAME,cardealer_Cityid,carserviceStn_Cityid,UsedCar_Cityid,UsedCar_Priceid,UsedCar_Brandid,UsedCar_Fuelid,UsedCar_BodyTypeid,UsedCarImage,Used_Detailed_ids,NewsReviewsDetailTITLE,NewsReviewsSTARTDATE,NewsReviewsDetailIMAGE,NewsReviewsDetailLONGDESCRP,NewsReviewsDetailUSERNAME,comparecar1ID,comparecar2ID,comparecar3ID,comparecar4ID,comparecar5ID,comparecar6ID,comparecar7ID,comparecar9ID,Statestr;





- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    sleep(3);
    // Override point for customization after application launch.
    return YES;
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
