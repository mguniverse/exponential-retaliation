//
//  AppDelegate.h
//  Exponential Retaliation
//
//  Created by Danny Perski on 10/17/13.
//  Copyright (c) 2013 Danny Perski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    AVAudioPlayer *music;
    int delayIntensity;
    BOOL musicDisabled;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

-(void)startMusic;
-(void)muteMusic;
-(void)unmuteMusic;

@property(nonatomic, strong) AVAudioPlayer *music;


@end