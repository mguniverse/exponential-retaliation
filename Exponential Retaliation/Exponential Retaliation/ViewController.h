//
//  ViewController.h
//  Exponential Retaliation
//
//  Created by Danny Perski on 12/6/13.
//  Copyright (c) 2013 Danny Perski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "jsJiggle.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <GameKit/GameKit.h>

@interface ViewController : UIViewController <GKGameCenterControllerDelegate> {
    int currentSelection;
    int buttonRadius;
    
    float animationSpeed;
    
    BOOL isJiggling;
    BOOL musicToggle;
    BOOL animating;
    
    IBOutlet UIButton *campaignButton;
    IBOutlet UIButton *editorButton;
    
    IBOutlet UIImageView *musicImage;
    IBOutlet UIImageView *musicFlashImage;
    
    jsJiggle *nucleus;
    IBOutlet UIImageView *nucleusImage;
}

@end
