//
//  ViewController.h
//  Exponential Retaliation
//
//  Created by Danny Perski on 12/6/13.
//  Copyright (c) 2013 Danny Perski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "jsJiggle.h"

@interface ViewController : UIViewController {
    int currentSelection;
    int buttonRadius;
    
    float animationSpeed;
    
    BOOL isJiggling;
    BOOL music;
    BOOL animating;
    
    IBOutlet UIButton *campaignButton;
    IBOutlet UIButton *editorButton;
    
    IBOutlet UIImageView *musicImage;
    IBOutlet UIImageView *musicFlashImage;
    
    jsJiggle *nucleus;
    IBOutlet UIImageView *nucleusImage;
}

@end
