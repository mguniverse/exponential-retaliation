//
//  AppDelegate.m
//  Exponential Retaliation
//
//  Created by Danny Perski on 10/17/13.
//  Copyright (c) 2013 Danny Perski. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

@synthesize music;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    } else {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)startMusic {
    //this line of code allows you to listen to music on iOS in the background
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:[NSDate date]];
    NSInteger currentHour = [components hour];
    NSInteger currentMinute = [components minute];
    NSInteger currentSecond = [components second];
    
    if (currentHour < 7 || (currentHour > 19 || (currentHour == 21 && (currentMinute > 0 || currentSecond > 0)))) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"el_jazz_2" ofType:@"wav"];
        music = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
        music.numberOfLoops = -1;
    }
    else {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"el_jazz_1" ofType:@"wav"];
        music = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
        music.numberOfLoops = -1;
    }
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"musicDisabled"]) {
    }
    else {
        [music play];
    }
}

-(void)muteMusic {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"musicDisabled"];
}

-(void)unmuteMusic {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"musicDisabled"];
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