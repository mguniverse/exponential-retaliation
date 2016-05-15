//
//  Levels_iPhone.h
//  Exponential Retaliation
//
//  Created by Danny Perski on 12/6/13.
//  Copyright (c) 2013 Danny Perski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "jsJiggle.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <Twitter/Twitter.h>

@interface Levels_iPhone : UIViewController {
    
    AVAudioPlayer *theAudio;
    
    int levelsCount;
    
    BOOL a1if;
    BOOL a2if;
    BOOL a3if;
    BOOL b1if;
    BOOL b2if;
    BOOL b3if;
    BOOL c1if;
    BOOL c2if;
    BOOL c3if;
    
    BOOL piecesDidAnimate;
    BOOL animating;
    
    int a1tower;
    int a2tower;
    int a3tower;
    int b1tower;
    int b2tower;
    int b3tower;
    int c1tower;
    int c2tower;
    int c3tower;
    
    BOOL a1split;
    BOOL a2split;
    BOOL a3split;
    BOOL b1split;
    BOOL b2split;
    BOOL b3split;
    BOOL c1split;
    BOOL c2split;
    BOOL c3split;
    
    BOOL a1wall;
    BOOL a2wall;
    BOOL a3wall;
    BOOL b1wall;
    BOOL b2wall;
    BOOL b3wall;
    BOOL c1wall;
    BOOL c2wall;
    BOOL c3wall;
    
    int interface;
    
    int totalPrestige;
    
    int a1n;
    int a2n;
    int a3n;
    int b1n;
    int b2n;
    int b3n;
    int c1n;
    int c2n;
    int c3n;
    
    int towers;
    int steps;
    int progress;
    int nilSteps;
    int topSteps;
    int currentLevel;
    int currentBombs;
    int explodeChannel;
    int buttonRadius;
    
    BOOL l1pr;
    BOOL l2pr;
    BOOL l3pr;
    BOOL l4pr;
    BOOL l5pr;
    BOOL l6pr;
    BOOL l7pr;
    BOOL l8pr;
    BOOL l9pr;
    BOOL l10pr;
    BOOL l11pr;
    BOOL l12pr;
    BOOL l13pr;
    BOOL l14pr;
    BOOL l15pr;
    BOOL l16pr;
    BOOL l17pr;
    BOOL l18pr;
    BOOL l19pr;
    BOOL l20pr;
    
    float animationIntensity;
    float animationSpeed;
    
    IBOutlet UIView *endView;
    IBOutlet UIView *endBanner;
    IBOutlet UIView *evaluationView;
    IBOutlet UIView *headerView;
    
    IBOutlet UISwipeGestureRecognizer *swipeUp;
    
    IBOutlet UIView *gridView;
    
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
    IBOutlet UIView *a1v;
    IBOutlet UIView *a2v;
    IBOutlet UIView *a3v;
    IBOutlet UIView *b1v;
    IBOutlet UIView *b2v;
    IBOutlet UIView *b3v;
    IBOutlet UIView *c1v;
    IBOutlet UIView *c2v;
    IBOutlet UIView *c3v;
    IBOutlet UIButton *restartButton;
    IBOutlet UIButton *cancelButton;
    IBOutlet UIButton *leftButton;
    IBOutlet UIButton *rightButton;
    IBOutlet UIButton *levelSelectButton;
    IBOutlet UIButton *nextLevelButton;
    
    IBOutlet UILabel *levelLabel;
    IBOutlet UILabel *descriptionLabel;
    IBOutlet UILabel *bombsLabel;
    IBOutlet UILabel *evaluationLabel;
    
    IBOutlet UITextView *evaluationText;
    
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
-(IBAction)next;

-(IBAction)level:(int)currentLevel;

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