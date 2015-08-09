//
//  Editor_iPhone.h
//  Exponential Retaliation
//
//  Created by Danny Perski on 2/19/14.
//  Copyright (c) 2014 Danny Perski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "jsJiggle.h"
#import <AVFoundation/AVFoundation.h>
#import <Twitter/Twitter.h>

@interface Editor_iPhone : UIViewController {
    
    AVAudioPlayer *theAudio;
    
    int levelsCount;
    int editmode;
    int gamemode;
    
    BOOL a1if;
    BOOL a2if;
    BOOL a3if;
    BOOL b1if;
    BOOL b2if;
    BOOL b3if;
    BOOL c1if;
    BOOL c2if;
    BOOL c3if;
    
    int a1tower;
    int a2tower;
    int a3tower;
    int b1tower;
    int b2tower;
    int b3tower;
    int c1tower;
    int c2tower;
    int c3tower;
    
    BOOL a1wall;
    BOOL a2wall;
    BOOL a3wall;
    BOOL b1wall;
    BOOL b2wall;
    BOOL b3wall;
    BOOL c1wall;
    BOOL c2wall;
    BOOL c3wall;
    
    int a1n;
    int a2n;
    int a3n;
    int b1n;
    int b2n;
    int b3n;
    int c1n;
    int c2n;
    int c3n;
    
    int interface;
    
    BOOL piecesDidAnimate;
    
    int totalPrestige;
    int level1prestige;
    int level2prestige;
    int level3prestige;
    
    int towers;
    int steps;
    int progress;
    int nilSteps;
    int topSteps;
    int currentLevel;
    int currentBombs;
    int explodeChannel;
    
    float animationIntensity;
    float animationSpeed;
    
    IBOutlet UIView *endView;
    
    IBOutlet UISwipeGestureRecognizer *swipeUp;
    
    jsJiggle *a1j;
    jsJiggle *a2j;
    jsJiggle *a3j;
    jsJiggle *b1j;
    jsJiggle *b2j;
    jsJiggle *b3j;
    jsJiggle *c1j;
    jsJiggle *c2j;
    jsJiggle *c3j;
    
    IBOutlet UIButton *a1b;
    IBOutlet UIButton *a2b;
    IBOutlet UIButton *a3b;
    IBOutlet UIButton *b1b;
    IBOutlet UIButton *b2b;
    IBOutlet UIButton *b3b;
    IBOutlet UIButton *c1b;
    IBOutlet UIButton *c2b;
    IBOutlet UIButton *c3b;
    IBOutlet UIButton *restartButton;
    IBOutlet UIButton *cancelButton;
    IBOutlet UIButton *leftButton;
    IBOutlet UIButton *rightButton;
    IBOutlet UIButton *levelSelectButton;
    IBOutlet UIButton *nextLevelButton;
    
    IBOutlet UILabel *gamemodeLabel;
    IBOutlet UILabel *descriptionLabel;
    IBOutlet UILabel *editmodeLabel;
    
    IBOutlet UIImageView *a1i;
    IBOutlet UIImageView *a2i;
    IBOutlet UIImageView *a3i;
    IBOutlet UIImageView *b1i;
    IBOutlet UIImageView *b2i;
    IBOutlet UIImageView *b3i;
    IBOutlet UIImageView *c1i;
    IBOutlet UIImageView *c2i;
    IBOutlet UIImageView *c3i;
    
    IBOutlet UIImageView *prestige;
    IBOutlet UIImageView *levelLock;
}

-(IBAction) switchLeft;
-(IBAction) switchRight;
-(IBAction) switchMode;

-(IBAction) a1a;
-(IBAction) a2a;
-(IBAction) a3a;
-(IBAction) b1a;
-(IBAction) b2a;
-(IBAction) b3a;
-(IBAction) c1a;
-(IBAction) c2a;
-(IBAction) c3a;

-(IBAction)cancelGrid;
-(IBAction)retry;

//-(IBAction)level:(int)currentLevel;

@property(nonatomic, retain) IBOutlet UIImageView *a1i;
@property(nonatomic, retain) IBOutlet UIImageView *a2i;
@property(nonatomic, retain) IBOutlet UIImageView *a3i;
@property(nonatomic, retain) IBOutlet UIImageView *b1i;
@property(nonatomic, retain) IBOutlet UIImageView *b2i;
@property(nonatomic, retain) IBOutlet UIImageView *b3i;
@property(nonatomic, retain) IBOutlet UIImageView *c1i;
@property(nonatomic, retain) IBOutlet UIImageView *c2i;
@property(nonatomic, retain) IBOutlet UIImageView *c3i;

@property (nonatomic, retain) IBOutlet UILabel *a1l;
@property (nonatomic, retain) IBOutlet UILabel *a2l;
@property (nonatomic, retain) IBOutlet UILabel *a3l;
@property (nonatomic, retain) IBOutlet UILabel *b1l;
@property (nonatomic, retain) IBOutlet UILabel *b2l;
@property (nonatomic, retain) IBOutlet UILabel *b3l;
@property (nonatomic, retain) IBOutlet UILabel *c1l;
@property (nonatomic, retain) IBOutlet UILabel *c2l;
@property (nonatomic, retain) IBOutlet UILabel *c3l;

@end
