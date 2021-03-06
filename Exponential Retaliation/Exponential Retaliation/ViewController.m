//
//  ViewController.m
//  Exponential Retaliation
//
//  Created by Danny Perski on 12/6/13.
//  Copyright (c) 2013 Danny Perski. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Levels_iPhone.h"
#import "Editor_iPhone.h"

@interface ViewController ()

// A flag indicating whether the Game Center features can be used after a user has been authenticated.
@property (nonatomic) BOOL gameCenterEnabled;

// This property stores the default leaderboard's identifier.
@property (nonatomic, strong) NSString *leaderboardIdentifier;

@end

@implementation ViewController

-(IBAction)startGame {
    //stops the jiggling before switching views
    [nucleus stopJiggle];
    isJiggling = false;
    
    Levels_iPhone *mvc =[[Levels_iPhone alloc] initWithNibName:@"Levels_iPhone" bundle:nil];
    [self presentViewController:mvc animated:NO completion:nil];
}

-(IBAction)editor {
    Editor_iPhone *mvc =[[Editor_iPhone alloc] initWithNibName:@"Editor_iPhone" bundle:nil];
    [self presentViewController:mvc animated:NO completion:nil];
}

-(IBAction)toggleJiggle {
    if (isJiggling == false) {
        [nucleus startJiggle];
        isJiggling = true;
    }
    else {
        [nucleus stopJiggle];
        isJiggling = false;
    }
}

-(IBAction)toggleMusic {
    musicFlashImage.alpha = 0;
    musicFlashImage.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    
    if (musicToggle == false) {
        musicToggle = true;
        [musicImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"music-off.png"]]];
        [musicFlashImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"music-off.png"]]];
        musicFlashImage.alpha = 1;
        AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
        [appDelegate.music stop];
        [appDelegate muteMusic];
    }
    else {
        musicToggle = false;
        [musicFlashImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"music-on.png"]]];
        [musicImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"music-on.png"]]];
        musicFlashImage.alpha = 1;
        AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
        [appDelegate.music play];
        [appDelegate unmuteMusic];
    }
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    musicFlashImage.alpha = 0;
    musicFlashImage.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
    [UIView commitAnimations];
}

-(void)hideAllButtons {
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)authenticateLocalPlayer{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
        if (viewController != nil) {
            [self presentViewController:viewController animated:YES completion:nil];
        }
        else{
            if ([GKLocalPlayer localPlayer].authenticated) {
                _gameCenterEnabled = YES;
                
                // Get the default leaderboard identifier.
                [[GKLocalPlayer localPlayer] loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *leaderboardIdentifier, NSError *error) {
                    
                    if (error != nil) {
                        NSLog(@"%@", [error localizedDescription]);
                    }
                    else{
                        _leaderboardIdentifier = leaderboardIdentifier;
                    }
                }];
            }
            
            else{
                _gameCenterEnabled = NO;
            }
        }
    };
}

-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [self authenticateLocalPlayer];
    
    buttonRadius = 10;
    animationSpeed = 0.5;
    nucleus = [[jsJiggle alloc]initWithObject:nucleusImage];
    isJiggling = false;
    
    musicToggle = [[NSUserDefaults standardUserDefaults] integerForKey:@"savedMusic"];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"musicDisabled"]) {
        [musicImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"music-off.png"]]];
        musicToggle = true;
    }
    else {
        [musicImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"music-on.png"]]];
        musicToggle = false;
    }
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [appDelegate startMusic];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
