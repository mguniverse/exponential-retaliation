//
//  Levels_iPhone.m
//  Exponential Retaliation
//
//  Created by Danny Perski on 12/6/13.
//  Copyright (c) 2013 Danny Perski. All rights reserved.
//

#import "Levels_iPhone.h"

@implementation Levels_iPhone

@synthesize a1i;
@synthesize a2i;
@synthesize a3i;
@synthesize b1i;
@synthesize b2i;
@synthesize b3i;
@synthesize c1i;
@synthesize c2i;
@synthesize c3i;

@synthesize a1l;
@synthesize a2l;
@synthesize a3l;
@synthesize b1l;
@synthesize b2l;
@synthesize b3l;
@synthesize c1l;
@synthesize c2l;
@synthesize c3l;

-(IBAction) switchLeft {
    if (animating == false && interface == 0) {
        [self snapSound];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        gridView.transform = CGAffineTransformMakeTranslation(160, 0);
        gridView.alpha = 0;
        //prestige.transform = CGAffineTransformMakeTranslation(160, 0);
        //prestige.alpha = 0;
        //descriptionLabel.transform = CGAffineTransformMakeTranslation(160, 0);
        //descriptionLabel.alpha = 0;
        
        [UIView commitAnimations];
        
        [self performSelector:@selector(offsetSwitchLeft) withObject:self afterDelay:animationSpeed];
    }
}

-(void)offsetSwitchLeft {
    currentLevel = currentLevel - 1;
    if (currentLevel < 1) {
        currentLevel = levelsCount;
    }
    [self level:currentLevel];
    gridView.transform = CGAffineTransformMakeTranslation(-160, 0);
    //prestige.transform = CGAffineTransformMakeTranslation(-160, 0);
    //descriptionLabel.transform = CGAffineTransformMakeTranslation(-160, 0);
    
    [self setLevelPosition];
}

-(IBAction) switchRight {
    if (animating == false && interface == 0) {
        [self snapSound];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        gridView.transform = CGAffineTransformMakeTranslation(-160, 0);
        gridView.alpha = 0;
        //prestige.transform = CGAffineTransformMakeTranslation(-160, 0);
        //prestige.alpha = 0;
        //descriptionLabel.transform = CGAffineTransformMakeTranslation(-160, 0);
        //descriptionLabel.alpha = 0;
        
        [UIView commitAnimations];
        
        [self performSelector:@selector(offsetSwitchRight) withObject:self afterDelay:animationSpeed];
    }
}

-(void)offsetSwitchRight {
    currentLevel = currentLevel + 1;
    if (currentLevel > levelsCount) {
        currentLevel = 1;
    }
    [self level:currentLevel];
    gridView.transform = CGAffineTransformMakeTranslation(160, 0);
    //prestige.transform = CGAffineTransformMakeTranslation(160, 0);
    //descriptionLabel.transform = CGAffineTransformMakeTranslation(160, 0);
    
    [self setLevelPosition];
}

-(void)setLevelPosition {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    gridView.transform = CGAffineTransformMakeTranslation(0, 0);
    gridView.alpha = 1;
    //prestige.transform = CGAffineTransformMakeTranslation(0, 0);
    //prestige.alpha = 1;
    //descriptionLabel.transform = CGAffineTransformMakeTranslation(0, 0);
    //descriptionLabel.alpha = 1;
    
    [UIView commitAnimations];
}

-(void)menuInterface {
    restartButton.hidden = true;
    cancelButton.hidden = true;
    levelSelectButton.hidden = true;
    
    interface = 0;
    
    levelLabel.transform = CGAffineTransformMakeTranslation(0, 60);
    descriptionLabel.transform = CGAffineTransformMakeTranslation(0, 60);
    
    [self loadLabels];
}

-(void)gameplayInterface {
    cancelButton.hidden = false;
    levelSelectButton.hidden = false;
    
    interface = 1;
    
    levelLabel.transform = CGAffineTransformMakeTranslation(0, -60);
    descriptionLabel.transform = CGAffineTransformMakeTranslation(0, -60);
    
    [self loadLabels];
}

-(void)level:(int)levelNumber {
    [self clearLevel];
    if (currentLevel == 1) {
        currentLevel = 1;
        c1n = 3;
        c3n = 2;
        b2wall = true;
        c2wall = true;
        c3tower = 1;
        towers = 1;
        topSteps = 4;
    }
    if (currentLevel == 2) {
        currentLevel = 2;
        a1n = 1;
        a3n = 4;
        c2n = 4;
        c1wall = true;
        c3wall = true;
        c2tower = 1;
        towers = 1;
        topSteps = 3;
    }
    if (currentLevel == 3) {
        currentLevel = 3;
        a3n = 8;
        b1n = 5;
        b3n = 2;
        c1n = 9;
        c2n = 4;
        a1wall = true;
        a2wall = true;
        b2wall = true;
        a3tower = 1;
        b1tower = 1;
        towers = 2;
        topSteps = 6;
    }
    if (currentLevel == 4) {
        currentLevel = 4;
        a1n = 7;
        a2n = 6;
        a3n = 1;
        b1n = 13;
        b3n = 9;
        c1n = 4;
        c2n = 1;
        c3n = 5;
        b1tower = 1;
        b3tower = 1;
        b2wall = true;
        towers = 2;
        topSteps = 7;
    }
    if (currentLevel == 5) {
        currentLevel = 5;
        a1n = 12;
        a2n = 9;
        a3n = 5;
        b1n = 6;
        c2n = 13;
        c3n = 8;
        b2wall = true;
        c1wall = true;
        a1tower = 1;
        a3tower = 1;
        c3tower = 1;
        towers = 3;
        topSteps = 6;
    }
    if (currentLevel == 6) {
        currentLevel = 6;
        a1n = 14;
        a2n = 11;
        b1n = 6;
        b3n = 7;
        c2n = 8;
        c3n = 16;
        a3wall = true;
        b2wall = true;
        c1wall = true;
        a1tower = 1;
        c3tower = 1;
        towers = 2;
        topSteps = 4;
    }
    if (currentLevel == 7) {
        currentLevel = 7;
        a1n = 6;
        a2n = 24;
        a3n = 6;
        b2n = 13;
        c2n = 11;
        c3n = 12;
        b1wall = true;
        c1wall = true;
        b3wall = true;
        a2tower = 1;
        c2tower = 1;
        towers = 2;
        topSteps = 5;
    }
    if (currentLevel == 8) {
        currentLevel = 8;
        a1n = 7;
        a2n = 21;
        a3n = 7;
        b1n = 4;
        b3n = 4;
        b2wall = true;
        c1wall = true;
        c3wall = true;
        a2tower = 1;
        towers = 1;
        topSteps = 5;
    }
    if (currentLevel == 9) {
        currentLevel = 9;
        a1n = 10;
        a2n = 9;
        a3n = 2;
        c1n = 7;
        c2n = 4;
        c3n = 10;
        b1wall = true;
        b2wall = true;
        b3wall = true;
        a1tower = 1;
        c3tower = 1;
        towers = 2;
        topSteps = 5;
    }
    if (currentLevel == 10) {
        currentLevel = 10;
        a2n = 9;
        a3n = 2;
        b1n = 11;
        b2n = 43;
        b3n = 11;
        c1n = 7;
        c2n = 4;
        a1wall = true;
        c3wall = true;
        b2tower = 1;
        towers = 1;
        topSteps = 6;
    }
    if (currentLevel == 11) {
        currentLevel = 11;
        a3split = true;
        c3n = 12;
        a1n = 5;
        c2n = 5;
        a1tower = 1;
        c2tower = 1;
        a2wall = true;
        b2wall = true;
        c1wall = true;
        towers = 2;
        topSteps = 6;
    }
    if (currentLevel == 12) {
        currentLevel = 12;
        a1n = 5;
        a2n = 4;
        a3n = 1;
        b1n = 6;
        b2n = 9;
        b3n = 3;
        c1n = 8;
        c2n = 2;
        c3n = 7;
        a1tower = 1;
        b2tower = 1;
        c3tower = 1;
        towers = 3;
        topSteps = 8;
    }
    if (currentLevel == 13) {
        currentLevel = 13;
        a1n = 8;
        a2n = 5;
        a3n = 15;
        b2n = 10;
        b3n = 6;
        c1n = 8;
        a3tower = 1;
        b2tower = 1;
        b1wall = true;
        c2wall = true;
        c3split = true;
        towers = 2;
        topSteps = 5;
    }
    if (currentLevel == 14) {
        currentLevel = 14;
        a1n = 10;
        a2n = 6;
        a3n = 13;
        b1n = 9;
        b3n = 13;
        c1n = 12;
        c2n = 10;
        a1tower = 1;
        a3tower = 1;
        c1tower = 1;
        b2wall = true;
        c3split = true;
        towers = 3;
        topSteps = 9;
    }
    if (currentLevel == 15) {
        currentLevel = 15;
        a1n = 10;
        a2n = 10;
        b1n = 10;
        b3n = 15;
        c3n = 14;
        c3tower = 3;
        a3wall = true;
        b2wall = true;
        c2wall = true;
        c1split = true;
        towers = 3;
        topSteps = 7;
    }
    if (currentLevel == 16) {
        currentLevel = 16;
        a1n = 12;
        a3n = 25;
        b2n = 10;
        b3n = 8;
        c1n = 6;
        c3n = 15;
        a1tower = 1;
        a3tower = 1;
        a2wall = true;
        c2wall = true;
        b1split = true;
        towers = 2;
        topSteps = 7;
    }
    if (currentLevel == 17) {
        currentLevel = 17;
        a2n = 2;
        a3n = 8;
        b1n = 7;
        b2n = 11;
        b3n = 12;
        c1n = 10;
        c2n = 5;
        b1tower = 2;
        c1tower = 2;
        a1wall = true;
        c3split = true;
        towers = 4;
        topSteps = 8;
    }
    if (currentLevel == 18) {
        currentLevel = 18;
        a1n = 14;
        b1n = 13;
        b2n = 20;
        c2n = 10;
        c3n = 12;
        
        a1tower = 2;
        c3tower = 1;
        a2wall = true;
        a3wall = true;
        b3split = true;
        c1split = true;
        towers = 3;
        topSteps = 10;
    }
    if (currentLevel == 19) {
        currentLevel = 19;
        a2n = 8;
        a3n = 18;
        b1n = 24;
        b3n = 16;
        c2n = 18;
        
        a2tower = 3;
        b1tower = 1;
        a1wall = true;
        c1wall = true;
        b2split = true;
        c3split = true;
        towers = 4;
        topSteps = 8;
    }
    if (currentLevel == 20) {
        currentLevel = 20;
        a1n = 29;
        a2n = 7;
        a3n = 14;
        b1n = 10;
        b3n = 9;
        c1n = 10;
        c2n = 10;
        
        a1tower = 2;
        c3wall = true;
        b2split = true;
        towers = 2;
        topSteps = 8;
    }
    [self loadLevel];
}

-(void)snapSound {
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"finger_snap" ofType:@"wav"];
    //AVAudioPlayer* theAudio1=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    //theAudio1.delegate = self;
    //[theAudio1 play];
}

-(void)explodeSound {
    /*
     NSString *path = [[NSBundle mainBundle] pathForResource:@"explosion" ofType:@"wav"];
     AVAudioPlayer* theAudio2=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
     //theAudio2.delegate = self;
     [theAudio2 play];
     */
}

/*
 -(void)loadTotalBombs {
 totalBombs = level1bombs + level2bombs + level3bombs + level4bombs + level5bombs + level6bombs + level7bombs + level8bombs + level9bombs + level10bombs + level11bombs + level12bombs + level13bombs + level14bombs + level15bombs + level16bombs + level17bombs + level18bombs + level19bombs + level20bombs + level21bombs + level22bombs + level23bombs + level24bombs + level25bombs + level26bombs + level27bombs + level28bombs + level29bombs + level30bombs + level31bombs + level32bombs + level33bombs + level34bombs + level35bombs + level36bombs;
 bombsLabel.text = [NSString stringWithFormat:@"%i/%i BOMBS IGNITED", totalBombs, levelsCount * 3];
 }
 */

 -(void)loadProgress {
     //[self resetProgress];
     levelLock.hidden = false;
     if (progress >= currentLevel) {
         levelLock.hidden = true;
     }
 //NSLog(@"Progress loaded, progress is %i and currentLevel is %i", progress, currentLevel);
 }

-(void)loadLevel {
    [self freshGrid];
    [self loadProgress];
    
    steps = 0;
    nilSteps = towers;
    
    [self loadLabels];
    [self loadPrestige];
    
    a1l.text = [NSString stringWithFormat:@"%i", a1n];
    a2l.text = [NSString stringWithFormat:@"%i", a2n];
    a3l.text = [NSString stringWithFormat:@"%i", a3n];
    b1l.text = [NSString stringWithFormat:@"%i", b1n];
    b2l.text = [NSString stringWithFormat:@"%i", b2n];
    b3l.text = [NSString stringWithFormat:@"%i", b3n];
    c1l.text = [NSString stringWithFormat:@"%i", c1n];
    c2l.text = [NSString stringWithFormat:@"%i", c2n];
    c3l.text = [NSString stringWithFormat:@"%i", c3n];
    
    [self disableWalls];
    
    /*
     restartButton.hidden = false;
     cancelButton.hidden = true;
     */
    
    endView.alpha = 0;
    evaluationView.alpha = 0;
    
    //checks to see if current level is odd
    if (currentLevel & 1) {
        NSLog(@"The current level is odd.");
    }
}

-(void)loadLabels {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    levelLabel.transform = CGAffineTransformMakeTranslation(0, 0);
    levelLabel.alpha = 1;
    descriptionLabel.transform = CGAffineTransformMakeTranslation(0, 0);
    descriptionLabel.alpha = 1;
    
    [UIView commitAnimations];
    
    if (interface == 0) {
        levelLabel.text = [NSString stringWithFormat:@"LEVEL SELECT"];
        
        if (currentLevel < 10) {
            descriptionLabel.text = [NSString stringWithFormat:@"ENCRYPTION 00%i", currentLevel];
        }
        else if (currentLevel < 100) {
            descriptionLabel.text = [NSString stringWithFormat:@"ENCRYPTION 0%i", currentLevel];
        }
        else {
            descriptionLabel.text = [NSString stringWithFormat:@"ENCRYPTION %i", currentLevel];
        }
    }
    
    else if (interface == 1) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        levelLabel.transform = CGAffineTransformMakeTranslation(0, 0);
        levelLabel.alpha = 1;
        descriptionLabel.transform = CGAffineTransformMakeTranslation(0, 0);
        descriptionLabel.alpha = 1;
        
        [UIView commitAnimations];
        
        if (currentLevel < 10) {
            levelLabel.text = [NSString stringWithFormat:@"ENCRYPTION 00%i", currentLevel];
        }
        else if (currentLevel < 100) {
            levelLabel.text = [NSString stringWithFormat:@"ENCRYPTION 0%i", currentLevel];
        }
        else {
            levelLabel.text = [NSString stringWithFormat:@"ENCRYPTION %i", currentLevel];
        }
        
        if (topSteps < 10) {
            descriptionLabel.text = [NSString stringWithFormat:@"00%i STEPS TO PRESTIGE", topSteps];
        }
        else if (topSteps < 100) {
            descriptionLabel.text = [NSString stringWithFormat:@"0%i STEPS TO PRESTIGE", topSteps];
        }
        else {
            descriptionLabel.text = [NSString stringWithFormat:@"%i STEPS TO PRESTIGE", topSteps];
        }
    }
}

-(void)loadPrestige {
    if (currentLevel == 1) {
        if (l1pr == 1) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    else if (currentLevel == 2) {
        if (l2pr == 2) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    else if (currentLevel == 3) {
        if (l1pr == 3) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    else if (currentLevel == 4) {
        if (l1pr == 4) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    else if (currentLevel == 5) {
        if (l1pr == 5) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    else if (currentLevel == 6) {
        if (l1pr == 6) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    else if (currentLevel == 7) {
        if (l1pr == 7) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    else if (currentLevel == 8) {
        if (l1pr == 8) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    else if (currentLevel == 9) {
        if (l1pr == 9) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    else if (currentLevel == 10) {
        if (l1pr == 10) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    else if (currentLevel == 11) {
        if (l1pr == 11) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    else if (currentLevel == 12) {
        if (l1pr == 12) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    if (currentLevel == 13) {
        if (l1pr == 13) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    if (currentLevel == 14) {
        if (l1pr == 14) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    if (currentLevel == 15) {
        if (l1pr == 15) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    if (currentLevel == 16) {
        if (l1pr == 16) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    if (currentLevel == 17) {
        if (l1pr == 17) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    if (currentLevel == 18) {
        if (l1pr == 18) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    if (currentLevel == 19) {
        if (l1pr == 19) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
    if (currentLevel == 20) {
        if (l1pr == 20) {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-complete-emblem.png"]]];
        }
        else {
            [prestige setImage:[UIImage imageNamed:[NSString stringWithFormat:@"prestige-missing-emblem.png"]]];
        }
    }
}

-(void)winLevel {
     if (currentLevel >= progress) {
     progress = currentLevel + 1;
     [[NSUserDefaults standardUserDefaults] setInteger:progress forKey:@"savedProgress"];
     }
    
    evaluationView.transform = CGAffineTransformMakeTranslation(128, 0);
    
    [self performSelector:@selector(animateGridAway) withObject:self afterDelay:animationSpeed];
    
    steps = steps - nilSteps;
    
    if (steps <= topSteps) {
        evaluationLabel.text = [NSString stringWithFormat:@"ENCRYPTION COMPLETE"];
        evaluationText.text = [NSString stringWithFormat:@"YOU HAVE ACHIEVED PRESTIGE WITH %i STEPS.", steps];
        [self updatePrestige];
    }
    
    if (steps > topSteps) {
        evaluationLabel.text = [NSString stringWithFormat:@"ENCRYPTION COMPLETE"];
        evaluationText.text = [NSString stringWithFormat:@"TRY AGAIN WITH %i LESS STEPS TO REACH PRESTIGE.", steps-topSteps];
    }
}

-(void)updatePrestige {
    if (currentLevel == 1) {
        l1pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l1pr forKey:@"savedPrestige1"];
    }
    else if (currentLevel == 2) {
        l2pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l2pr forKey:@"savedPrestige2"];
    }
    else if (currentLevel == 3) {
        l3pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige3"];
    }
    else if (currentLevel == 4) {
        l4pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige4"];
    }
    else if (currentLevel == 5) {
        l5pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige5"];
    }
    else if (currentLevel == 6) {
        l6pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige6"];
    }
    else if (currentLevel == 7) {
        l7pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige7"];
    }
    else if (currentLevel == 8) {
        l8pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige8"];
    }
    else if (currentLevel == 9) {
        l9pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige9"];
    }
    else if (currentLevel == 10) {
        l10pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige10"];
    }
    else if (currentLevel == 11) {
        l11pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige11"];
    }
    else if (currentLevel == 12) {
        l12pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige12"];
    }
    else if (currentLevel == 13) {
        l13pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige13"];
    }
    else if (currentLevel == 14) {
        l14pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige14"];
    }
    else if (currentLevel == 15) {
        l15pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige15"];
    }
    else if (currentLevel == 16) {
        l16pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige16"];
    }
    else if (currentLevel == 17) {
        l17pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige17"];
    }
    else if (currentLevel == 18) {
        l18pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige18"];
    }
    else if (currentLevel == 19) {
        l19pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige19"];
    }
    else if (currentLevel == 20) {
        l20pr = 1;
        [[NSUserDefaults standardUserDefaults] setInteger:l3pr forKey:@"savedPrestige20"];
    }
}

-(IBAction)retry {
    if (animating == false) {
        animating = true;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        evaluationView.transform = CGAffineTransformMakeTranslation(-128, 0);
        endView.alpha = 0;
        evaluationView.alpha = 0;
        
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationDelay:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
        headerView.transform = CGAffineTransformMakeTranslation(0, 0);
        
        [UIView commitAnimations];
        
        [self level:currentLevel];
        [self performSelector:@selector(endAnimation) withObject:self afterDelay:0.4];
    }
}

-(IBAction)next {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    evaluationView.transform = CGAffineTransformMakeTranslation(-128, 0);
    endView.alpha = 0;
    evaluationView.alpha = 0;
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationDelay:animationSpeed];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    headerView.transform = CGAffineTransformMakeTranslation(0, 0);
    
    [UIView commitAnimations];
    
    [self performSelector:@selector(endNext) withObject:self afterDelay:0.4];
}

-(void)endNext {
    [self snapSound];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    gridView.transform = CGAffineTransformMakeTranslation(-160, 0);
    gridView.alpha = 0;
    
    [UIView commitAnimations];
    
    [self performSelector:@selector(offsetSwitchRight) withObject:self afterDelay:animationSpeed];
}

-(void)clearLevel {
    a1tower = 0;
    a2tower = 0;
    a3tower = 0;
    b1tower = 0;
    b2tower = 0;
    b3tower = 0;
    c1tower = 0;
    c2tower = 0;
    c3tower = 0;
    
    a1wall = false;
    a2wall = false;
    a3wall = false;
    b1wall = false;
    b2wall = false;
    b3wall = false;
    c1wall = false;
    c2wall = false;
    c3wall = false;
    
    a1split = false;
    a2split = false;
    a3split = false;
    b1split = false;
    b2split = false;
    b3split = false;
    c1split = false;
    c2split = false;
    c3split = false;
    
    a1n = 0;
    a2n = 0;
    a3n = 0;
    b1n = 0;
    b2n = 0;
    b3n = 0;
    c1n = 0;
    c2n = 0;
    c3n = 0;
    
    a1i.hidden = false;
    a2i.hidden = false;
    a3i.hidden = false;
    b1i.hidden = false;
    b2i.hidden = false;
    b3i.hidden = false;
    c1i.hidden = false;
    c2i.hidden = false;
    c3i.hidden = false;
    
    if (a1n <= 0) {
        a1l.hidden = false;
    }
    if (a2n <= 0) {
        a2l.hidden = false;
    }
    if (a3n <= 0) {
        a3l.hidden = false;
    }
    if (b1n <= 0) {
        b1l.hidden = false;
    }
    if (b2n <= 0) {
        b2l.hidden = false;
    }
    if (b3n <= 0) {
        b3l.hidden = false;
    }
    if (c1n <= 0) {
        c1l.hidden = false;
    }
    if (c2n <= 0) {
        c2l.hidden = false;
    }
    if (c3n <= 0) {
        c3l.hidden = false;
    }
    
    towers = 0;
}

-(void)prepareForSelection {
    if (interface == 0) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        levelLabel.transform = CGAffineTransformMakeTranslation(0, 60);
        levelLabel.alpha = 0;
        descriptionLabel.transform = CGAffineTransformMakeTranslation(0, 60);
        descriptionLabel.alpha = 0;
        
        [UIView commitAnimations];
        
        [self performSelector:@selector(gameplayInterface) withObject:self afterDelay:animationSpeed];
    }
    
    a1b.enabled = false;
    a2b.enabled = false;
    a3b.enabled = false;
    b1b.enabled = false;
    b2b.enabled = false;
    b3b.enabled = false;
    c1b.enabled = false;
    c2b.enabled = false;
    c3b.enabled = false;
    
    [self disableWalls];
    
    /*
     [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"box-bad.png"]]];
     [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"box-bad.png"]]];
     [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"box-bad.png"]]];
     [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"box-bad.png"]]];
     [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"box-bad.png"]]];
     [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"box-bad.png"]]];
     [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"box-bad.png"]]];
     [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"box-bad.png"]]];
     [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"box-bad.png"]]];
     */
    
    if (interface == 1) {
        restartButton.hidden = true;
        cancelButton.hidden = false;
    }
}

-(void)freshGrid {
    piecesDidAnimate = false;
    
    steps++;
    
    [self animatePiecesTogether];
    
    a1if = false;
    a2if = false;
    a3if = false;
    b1if = false;
    b2if = false;
    b3if = false;
    c1if = false;
    c2if = false;
    c3if = false;
    
    a1b.enabled = true;
    a2b.enabled = true;
    a3b.enabled = true;
    b1b.enabled = true;
    b2b.enabled = true;
    b3b.enabled = true;
    c1b.enabled = true;
    c2b.enabled = true;
    c3b.enabled = true;
    
    if (a1n <= 0) {
        a1b.enabled = false;
        a1l.hidden = true;
    }
    if (a2n <= 0) {
        a2b.enabled = false;
        a2l.hidden = true;
    }
    if (a3n <= 0) {
        a3b.enabled = false;
        a3l.hidden = true;
    }
    if (b1n <= 0) {
        b1b.enabled = false;
        b1l.hidden = true;
    }
    if (b2n <= 0) {
        b2b.enabled = false;
        b2l.hidden = true;
    }
    if (b3n <= 0) {
        b3b.enabled = false;
        b3l.hidden = true;
    }
    if (c1n <= 0) {
        c1b.enabled = false;
        c1l.hidden = true;
    }
    if (c2n <= 0) {
        c2b.enabled = false;
        c2l.hidden = true;
    }
    if (c3n <= 0) {
        c3b.enabled = false;
        c3l.hidden = true;
    }
    
    if (a1n != 0 && a1n > 0 && a1tower == 0 && a1split == false) {
        a1b.enabled = true;
        a1l.hidden = false;
    }
    if (a2n != 0 && a2n > 0 && a2tower == 0 && a2split == false) {
        a2b.enabled = true;
        a2l.hidden = false;
    }
    if (a3n != 0 && a3n > 0 && a3tower == 0 && a3split == false) {
        a3b.enabled = true;
        a3l.hidden = false;
    }
    if (b1n != 0 && b1n > 0 && b1tower == 0 && b1split == false) {
        b1b.enabled = true;
        b1l.hidden = false;
    }
    if (b2n != 0 && b2n > 0 && b2tower == 0 && b2split == false) {
        b2b.enabled = true;
        b2l.hidden = false;
    }
    if (b3n != 0 && b3n > 0 && b3tower == 0 && b3split == false) {
        b3b.enabled = true;
        b3l.hidden = false;
    }
    if (c1n != 0 && c1n > 0 && c1tower == 0 && c1split == false) {
        c1b.enabled = true;
        c1l.hidden = false;
    }
    if (c2n != 0 && c2n > 0 && c2tower == 0 && c2split == false) {
        c2b.enabled = true;
        c2l.hidden = false;
    }
    if (c3n != 0 && c3n > 0 && c3tower == 0 && c3split == false) {
        c3b.enabled = true;
        c3l.hidden = false;
    }
    
    [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
    [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
    [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
    [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
    [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
    [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
    [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
    [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
    [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
    
    //if a1tower has value, assign proper identifier
    if (a1tower == 1) {
        [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        a1b.enabled = false;
    }
    else if (a1tower == 2) {
        [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
        a1b.enabled = false;
    }
    else if (a1tower > 2) {
        [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
        a1b.enabled = false;
    }
    //if a2tower has value, assign proper identifier
    if (a2tower == 1) {
        [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        a2b.enabled = false;
    }
    else if (a2tower == 2) {
        [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
        a2b.enabled = false;
    }
    else if (a2tower > 2) {
        [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
        a2b.enabled = false;
    }
    //if a3tower has value, assign proper identifier
    if (a3tower == 1) {
        [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        a3b.enabled = false;
    }
    else if (a3tower == 2) {
        [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
        a3b.enabled = false;
    }
    else if (a3tower > 2) {
        [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
        a3b.enabled = false;
    }
    //if b1tower has value, assign proper identifier
    if (b1tower == 1) {
        [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        b1b.enabled = false;
    }
    else if (b1tower == 2) {
        [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
        b1b.enabled = false;
    }
    else if (b1tower > 2) {
        [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
        b1b.enabled = false;
    }
    //if b2tower has value, assign proper identifier
    if (b2tower == 1) {
        [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        b2b.enabled = false;
    }
    else if (b2tower == 2) {
        [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
        b2b.enabled = false;
    }
    else if (b2tower > 2) {
        [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
        b2b.enabled = false;
    }
    //if b3tower has value, assign proper identifier
    if (b3tower == 1) {
        [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        b3b.enabled = false;
    }
    else if (b3tower == 2) {
        [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
        b3b.enabled = false;
    }
    else if (b3tower > 2) {
        [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
        b3b.enabled = false;
    }
    //if c1tower has value, assign proper identifier
    if (c1tower == 1) {
        [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        c1b.enabled = false;
    }
    else if (c1tower == 2) {
        [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
        c1b.enabled = false;
    }
    else if (c1tower > 2) {
        [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
        c1b.enabled = false;
    }
    //if c2tower has value, assign proper identifier
    if (c2tower == 1) {
        [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        c2b.enabled = false;
    }
    else if (c2tower == 2) {
        [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
        c2b.enabled = false;
    }
    else if (c2tower > 2) {
        [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
        c2b.enabled = false;
    }
    //if c3tower has value, assign proper identifier
    if (c3tower == 1) {
        [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        c3b.enabled = false;
    }
    else if (c3tower == 2) {
        [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
        c3b.enabled = false;
    }
    else if (c3tower > 2) {
        [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
        c3b.enabled = false;
    }
    
    if (a1split == true) {
        [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
    }
    if (a2split == true) {
        [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
    }
    if (a3split == true) {
        [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
    }
    if (b1split == true) {
        [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
    }
    if (b2split == true) {
        [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
    }
    if (b3split == true) {
        [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
    }
    if (c1split == true) {
        [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
    }
    if (c2split == true) {
        [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
    }
    if (c3split == true) {
        [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
    }
    
    a1l.text = [NSString stringWithFormat:@"%i", a1n];
    a2l.text = [NSString stringWithFormat:@"%i", a2n];
    a3l.text = [NSString stringWithFormat:@"%i", a3n];
    b1l.text = [NSString stringWithFormat:@"%i", b1n];
    b2l.text = [NSString stringWithFormat:@"%i", b2n];
    b3l.text = [NSString stringWithFormat:@"%i", b3n];
    c1l.text = [NSString stringWithFormat:@"%i", c1n];
    c2l.text = [NSString stringWithFormat:@"%i", c2n];
    c3l.text = [NSString stringWithFormat:@"%i", c3n];
    
    [self disableWalls];
    
    if (towers <= 0) {
        [self winLevel];
    }
    
    if (interface == 1) {
        restartButton.hidden = false;
        cancelButton.hidden = true;
    }
}

-(void)disableWalls {
    if (a1wall == true) {
        a1n = 0;
        [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        a1b.enabled = false;
        a1l.hidden = true;
    }
    if (a2wall == true) {
        a2n = 0;
        [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        a2b.enabled = false;
        a2l.hidden = true;
    }
    if (a3wall == true) {
        a3n = 0;
        [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        a3b.enabled = false;
        a3l.hidden = true;
    }
    if (b1wall == true) {
        b1n = 0;
        [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        b1b.enabled = false;
        b1l.hidden = true;
    }
    if (b2wall == true) {
        b2n = 0;
        [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        b2b.enabled = false;
        b2l.hidden = true;
    }
    if (b3wall == true) {
        b3n = 0;
        [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        b3b.enabled = false;
        b3l.hidden = true;
    }
    if (c1wall == true) {
        c1n = 0;
        [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        c1b.enabled = false;
        c1l.hidden = true;
    }
    if (c2wall == true) {
        c2n = 0;
        [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        c2b.enabled = false;
        c2l.hidden = true;
    }
    if (c3wall == true) {
        c3n = 0;
        [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        c3b.enabled = false;
        c3l.hidden = true;
    }
}

-(void)animatePiecesAway {
    if (a1b.enabled == true || a1if == true) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        a1v.transform = CGAffineTransformMakeTranslation(-15, -15);
        
        [UIView commitAnimations];
    }
    if (a2b.enabled == true || a2if == true) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        a2v.transform = CGAffineTransformMakeTranslation(0, -15);
        
        [UIView commitAnimations];
    }
    if (a3b.enabled == true || a3if == true) {
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        a3v.transform = CGAffineTransformMakeTranslation(15, -15);
        
        [UIView commitAnimations];
    }
    if (b1b.enabled == true || b1if == true) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        b1v.transform = CGAffineTransformMakeTranslation(-15, 0);
        
        [UIView commitAnimations];
    }
    if (b3b.enabled == true || b3if == true) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        b3v.transform = CGAffineTransformMakeTranslation(15, 0);
        
        [UIView commitAnimations];
    }
    if (c1b.enabled == true || c1if == true) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        c1v.transform = CGAffineTransformMakeTranslation(-15, 15);
        
        [UIView commitAnimations];
    }
    if (c2b.enabled == true || c2if == true) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        c2v.transform = CGAffineTransformMakeTranslation(0, 15);
        
        [UIView commitAnimations];
    }
    if (c3b.enabled == true || c3if == true) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        c3v.transform = CGAffineTransformMakeTranslation(15, 15);
        
        [UIView commitAnimations];
    }
    
    [UIView commitAnimations];
}

-(void)animatePiecesTogether {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    a1v.transform = CGAffineTransformMakeTranslation(0, 0);
    a2v.transform = CGAffineTransformMakeTranslation(0, 0);
    a3v.transform = CGAffineTransformMakeTranslation(0, 0);
    b1v.transform = CGAffineTransformMakeTranslation(0, 0);
    b2v.transform = CGAffineTransformMakeTranslation(0, 0);
    b3v.transform = CGAffineTransformMakeTranslation(0, 0);
    c1v.transform = CGAffineTransformMakeTranslation(0, 0);
    c2v.transform = CGAffineTransformMakeTranslation(0, 0);
    c3v.transform = CGAffineTransformMakeTranslation(0, 0);
    
    [UIView commitAnimations];
    
    [self revertAnimation];
}

-(void)animateTheDisabled {
    animating = true;
    
    if (a1b.enabled == false && a1if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        a1v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        //a1v.alpha = animationIntensity;
        
        [UIView commitAnimations];
    }
    if (a2b.enabled == false && a2if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        a2v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        //a2v.alpha = animationIntensity;
        
        [UIView commitAnimations];
    }
    if (a3b.enabled == false && a3if == false) {
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        a3v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        //a3v.alpha = animationIntensity;
        
        [UIView commitAnimations];
    }
    if (b1b.enabled == false && b1if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        b1v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        //b1v.alpha = animationIntensity;
        
        [UIView commitAnimations];
    }
    if (b2b.enabled == false && b2if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        b2v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        //b2v.alpha = animationIntensity;
        
        [UIView commitAnimations];
    }
    if (b3b.enabled == false && b3if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        b3v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        //b3v.alpha = animationIntensity;
        
        [UIView commitAnimations];
    }
    if (c1b.enabled == false && c1if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        c1v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        //c1v.alpha = animationIntensity;
        
        [UIView commitAnimations];
    }
    if (c2b.enabled == false && c2if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        c2v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        //c2v.alpha = animationIntensity;
        
        [UIView commitAnimations];
    }
    if (c3b.enabled == false && c3if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        c3v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        //c3v.alpha = animationIntensity;
        
        [UIView commitAnimations];
    }
    
    piecesDidAnimate = true;
    [self performSelector:@selector(endAnimation) withObject:self afterDelay:animationSpeed];
}

-(void)animateGridAway {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    a1v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
    //a1v.alpha = 0;
        
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationDelay:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    a2v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
    //a2v.alpha = 0;
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationDelay:0.6];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    a3v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
    //a3v.alpha = 0;
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationDelay:0.8];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    b1v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
    //b1v.alpha = 0;
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationDelay:1.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    b2v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
    //b2v.alpha = 0;
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationDelay:1.2];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    b3v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
    //b3v.alpha = 0;
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationDelay:1.4];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    c1v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
    //c1v.alpha = 0;
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationDelay:1.6];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    c2v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
    //c2v.alpha = 0;
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationDelay:1.8];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    c3v.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
    //c3v.alpha = 0;
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationDelay:2];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    headerView.transform = CGAffineTransformMakeTranslation(0, -184);
    
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationDelay:2.2];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    endView.alpha = 0.2;
    evaluationView.alpha = 1;
    evaluationView.transform = CGAffineTransformMakeTranslation(0, 0);
    
    [UIView commitAnimations];
    
    //[self startJiggle];
    
    piecesDidAnimate = true;
    
    [self performSelector:@selector(endAnimation) withObject:self afterDelay:2.2];
}

-(void)revertAnimation {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    a1v.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    a2v.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    a3v.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    b1v.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    b2v.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    b3v.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    c1v.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    c2v.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    c3v.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    
    a1v.alpha = 1;
    a2v.alpha = 1;
    a3v.alpha = 1;
    b1v.alpha = 1;
    b2v.alpha = 1;
    b3v.alpha = 1;
    c1v.alpha = 1;
    c2v.alpha = 1;
    c3v.alpha = 1;
    
    [UIView commitAnimations];
    
    [self stopJiggle];
}

-(void)endAnimation {
    animating = false;
}

-(void)startJiggle {
    if (a1b.enabled == true && a1if == false) {
        [a1j startJiggle];
    }
    if (a2b.enabled == true && a2if == false) {
        [a2j startJiggle];
    }
    if (a3b.enabled == true && a3if == false) {
        [a3j startJiggle];
    }
    if (b1b.enabled == true && b1if == false) {
        [b1j startJiggle];
    }
    if (b2b.enabled == true && b2if == false) {
        [b2j startJiggle];
    }
    if (b3b.enabled == true && b3if == false) {
        [b3j startJiggle];
    }
    if (c1b.enabled == true && c1if == false) {
        [c1j startJiggle];
    }
    if (c2b.enabled == true && c2if == false) {
        [c2j startJiggle];
    }
    if (c3b.enabled == true && c3if == false) {
        [c3j startJiggle];
    }
}

-(void)stopJiggle {
    [a1j stopJiggle];
    [a2j stopJiggle];
    [a3j stopJiggle];
    [b1j stopJiggle];
    [b2j stopJiggle];
    [b3j stopJiggle];
    [c1j stopJiggle];
    [c2j stopJiggle];
    [c3j stopJiggle];
}

-(IBAction) a1a {
    if (animating == false) {
        if (a1if == true) {
            [self cancelGrid];
        }
        
        else {
            a1if = true;
            [self prepareForSelection];
            [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"selected-piece.png"]]];
            if (a2n < a1n && a2wall == false) {
                a2b.enabled = true;
            }
            if (b1n < a1n && b1wall == false) {
                b1b.enabled = true;
            }
            if (b2n < a1n && b2wall == false) {
                b2b.enabled = true;
            }
            
            //enable the button, so it can be tapped again to cancel out
            a1b.enabled = true;
            
            if (piecesDidAnimate == false) {
                [self animateTheDisabled];
            }
            
            if (a2if == true) {
                if (a1tower > 0) {
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    a1tower--;
                    if (a1tower == 0) {
                        a1n = 0;
                    }
                    a2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (a1split == true) {
                    a2n = a2n / 2;
                    a1n = a2n;
                    a1split = false;
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    [self freshGrid];
                }
                else {
                    a1n = a1n + a2n;
                    a2n = 0;
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    [self freshGrid];
                }
            }
            
            if (b1if == true) {
                if (a1tower > 0) {
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    a1tower--;
                    if (a1tower == 0) {
                        a1n = 0;
                    }
                    b1n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (a1split == true) {
                    b1n = b1n / 2;
                    a1n = b1n;
                    a1split = false;
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    b1l.text = [NSString stringWithFormat:@"%i", a2n];
                    [self freshGrid];
                }
                else {
                    a1n = a1n + b1n;
                    b1n = 0;
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    [self freshGrid];
                }
            }
            
            if (b2if == true) {
                if (a1tower > 0) {
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    a1tower--;
                    if (a1tower == 0) {
                        a1n = 0;
                    }
                    b2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (a1split == true) {
                    b2n = b2n / 2;
                    a1n = b2n;
                    a1split = false;
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
                else {
                    a1n = a1n + b2n;
                    b2n = 0;
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
            }
            
            else {
                
            }
        }
    }
}

-(IBAction) a2a {
    if (animating == false) {
        if (a2if == true) {
            [self cancelGrid];
        }
        else {
            a2if = true;
            [self prepareForSelection];
            [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"selected-piece.png"]]];
            if (a1n < a2n && a1wall == false) {
                a1b.enabled = true;
            }
            if (a3n < a2n && a3wall == false) {
                a3b.enabled = true;
            }
            if (b1n < a2n && b1wall == false) {
                b1b.enabled = true;
            }
            if (b2n < a2n && b2wall == false) {
                b2b.enabled = true;
            }
            if (b3n < a2n && b3wall == false) {
                b3b.enabled = true;
            }
            
            //enable the button, so it can be tapped again to cancel out
            a2b.enabled = true;
            
            if (piecesDidAnimate == false) {
                [self animateTheDisabled];
            }
            
            if (a1if == true) {
                if (a2tower > 0) {
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    a2tower--;
                    if (a2tower == 0) {
                        a2n = 0;
                    }
                    a1n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (a2split == true) {
                    a1n = a1n / 2;
                    a2n = a1n;
                    a2split = false;
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    [self freshGrid];
                }
                else {
                    a2n = a2n + a1n;
                    a1n = 0;
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    [self freshGrid];
                }
            }
            if (b1if == true) {
                if (a2tower > 0) {
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    a2tower--;
                    if (a2tower == 0) {
                        a2n = 0;
                    }
                    b1n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (a2split == true) {
                    b1n = b1n / 2;
                    a2n = b1n;
                    a2split = false;
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    [self freshGrid];
                }
                else {
                    a2n = a2n + b1n;
                    b1n = 0;
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    [self freshGrid];
                }
            }
            if (b2if == true) {
                if (a2tower > 0) {
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    a2tower--;
                    if (a2tower == 0) {
                        a2n = 0;
                    }
                    b2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (a2split == true) {
                    b2n = b2n / 2;
                    a2n = b2n;
                    a2split = false;
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
                else {
                    a2n = a2n + b2n;
                    b2n = 0;
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
            }
            if (b3if == true) {
                if (a2tower > 0) {
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    a2tower--;
                    if (a2tower == 0) {
                        a2n = 0;
                    }
                    b3n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (a2split == true) {
                    b3n = b3n / 2;
                    a2n = b3n;
                    a2split = false;
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    [self freshGrid];
                }
                else {
                    a2n = a2n + b3n;
                    b3n = 0;
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    [self freshGrid];
                }
            }
            if (a3if == true) {
                if (a2tower > 0) {
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    a2tower--;
                    if (a2tower == 0) {
                        a2n = 0;
                    }
                    a3n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (a2split == true) {
                    a3n = a3n / 2;
                    a2n = a3n;
                    a2split = false;
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    [self freshGrid];
                }
                else {
                    a2n = a2n + a3n;
                    a3n = 0;
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    [self freshGrid];
                }
            }
        }
    }
}
-(IBAction) a3a {
    if (animating == false) {
        if (a3if == true) {
            [self cancelGrid];
        }
        else {
            a3if = true;
            [self prepareForSelection];
            [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"selected-piece.png"]]];
            if (a2n < a3n && a2wall == false) {
                a2b.enabled = true;
            }
            if (b2n < a3n && b2wall == false) {
                b2b.enabled = true;
            }
            if (b3n < a3n && b3wall == false) {
                b3b.enabled = true;
            }
            
            //enable the button, so it can be tapped again to cancel out
            a3b.enabled = true;
            
            if (piecesDidAnimate == false) {
                [self animateTheDisabled];
            }
            
            if (a2if == true) {
                if (a3tower > 0) {
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    a3tower--;
                    if (a3tower == 0) {
                        a3n = 0;
                    }
                    a2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (a3split == true) {
                    a2n = a2n / 2;
                    a3n = a2n;
                    a3split = false;
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    [self freshGrid];
                }
                else {
                    a3n = a3n + a2n;
                    a2n = 0;
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    [self freshGrid];
                }
            }
            
            if (b2if == true) {
                if (a3tower > 0) {
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    a3tower--;
                    if (a3tower == 0) {
                        a3n = 0;
                    }
                    b2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (a3split == true) {
                    b2n = b2n / 2;
                    a3n = b2n;
                    a3split = false;
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
                else {
                    a3n = a3n + b2n;
                    b2n = 0;
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
            }
            if (b3if == true) {
                if (a3tower > 0) {
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    a3tower--;
                    if (a3tower == 0) {
                        a3n = 0;
                    }
                    b3n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (a3split == true) {
                    b3n = b3n / 2;
                    a3n = b3n;
                    a3split = false;
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    [self freshGrid];
                }
                else {
                    a3n = a3n + b3n;
                    b3n = 0;
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    [self freshGrid];
                }
            }
        }
    }
}
-(IBAction) b1a {
    if (animating == false) {
        if (b1if == true) {
            [self cancelGrid];
        }
        else {
            b1if = true;
            [self prepareForSelection];
            [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"selected-piece.png"]]];
            
            if (a1n < b1n && a1wall == false) {
                a1b.enabled = true;
            }
            if (a2n < b1n && a2wall == false) {
                a2b.enabled = true;
            }
            if (b2n < b1n && b2wall == false) {
                b2b.enabled = true;
            }
            if (c1n < b1n && c1wall == false) {
                c1b.enabled = true;
            }
            if (c2n < b1n && c2wall == false) {
                c2b.enabled = true;
            }
            
            //enable the button, so it can be tapped again to cancel out
            b1b.enabled = true;
            
            if (piecesDidAnimate == false) {
                [self animateTheDisabled];
            }
            
            if (a1if == true) {
                if (b1tower > 0) {
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    b1tower--;
                    if (b1tower == 0) {
                        b1n = 0;
                    }
                    a1n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b1split == true) {
                    a1n = a1n / 2;
                    b1n = a1n;
                    b1split = false;
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    [self freshGrid];
                }
                else {
                    b1n = b1n + a1n;
                    a1n = 0;
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    [self freshGrid];
                }
            }
            if (a2if == true) {
                if (b1tower > 0) {
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    b1tower--;
                    if (b1tower == 0) {
                        b1n = 0;
                    }
                    a2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b1split == true) {
                    a2n = a2n / 2;
                    b1n = a2n;
                    b1split = false;
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    [self freshGrid];
                }
                else {
                    b1n = b1n + a2n;
                    a2n = 0;
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    [self freshGrid];
                }
            }
            if (b2if == true) {
                if (b1tower > 0) {
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    b1tower--;
                    if (b1tower == 0) {
                        b1n = 0;
                    }
                    b2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b1split == true) {
                    b2n = b2n / 2;
                    b1n = b2n;
                    b1split = false;
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    [self freshGrid];
                }
                else {
                    b1n = b1n + b2n;
                    b2n = 0;
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
            }
            if (c2if == true) {
                if (b1tower > 0) {
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    b1tower--;
                    if (b1tower == 0) {
                        b1n = 0;
                    }
                    c2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b1split == true) {
                    c2n = c2n / 2;
                    b1n = c2n;
                    b1split = false;
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    [self freshGrid];
                }
                else {
                    b1n = b1n + c2n;
                    c2n = 0;
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    [self freshGrid];
                }
            }
            if (c1if == true) {
                if (b1tower > 0) {
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    b1tower--;
                    if (b1tower == 0) {
                        b1n = 0;
                    }
                    c1n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b1split == true) {
                    c1n = c1n / 2;
                    b1n = c1n;
                    b1split = false;
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    [self freshGrid];
                }
                else {
                    b1n = b1n + c1n;
                    c1n = 0;
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    [self freshGrid];
                }
            }
        }
    }
}

-(IBAction) b2a {
    if (animating == false) {
        if (b2if == true) {
            [self cancelGrid];
        }
        else {
            b2if = true;
            [self prepareForSelection];
            [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"selected-piece.png"]]];
            if (a1n < b2n && a1wall == false) {
                a1b.enabled = true;
            }
            if (a2n < b2n && a2wall == false) {
                a2b.enabled = true;
            }
            if (a3n < b2n && a3wall == false) {
                a3b.enabled = true;
            }
            if (b1n < b2n && b1wall == false) {
                b1b.enabled = true;
            }
            if (b3n < b2n && b3wall == false) {
                b3b.enabled = true;
            }
            if (c1n < b2n && c1wall == false) {
                c1b.enabled = true;
            }
            if (c2n < b2n && c2wall == false) {
                c2b.enabled = true;
            }
            if (c3n < b2n && c3wall == false) {
                c3b.enabled = true;
            }
            
            //enable the button, so it can be tapped again to cancel out
            b2b.enabled = true;
            
            if (piecesDidAnimate == false) {
                [self animateTheDisabled];
            }
            
            if (a1if == true) {
                if (b2tower > 0) {
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    b2tower--;
                    if (b2tower == 0) {
                        b2n = 0;
                    }
                    a1n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b2split == true) {
                    a1n = a1n / 2;
                    b2n = a1n;
                    b2split = false;
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
                else {
                    b2n = b2n + a1n;
                    a1n = 0;
                    a1l.text = [NSString stringWithFormat:@"%i", a1n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
            }
            if (a2if == true) {
                if (b2tower > 0) {
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    b2tower--;
                    if (b2tower == 0) {
                        b2n = 0;
                    }
                    a2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b2split == true) {
                    a2n = a2n / 2;
                    b2n = a2n;
                    b2split = false;
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
                else {
                    b2n = b2n + a2n;
                    a2n = 0;
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    [self freshGrid];
                }
            }
            if (b1if == true) {
                if (b2tower > 0) {
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    b2tower--;
                    if (b2tower == 0) {
                        b2n = 0;
                    }
                    b1n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b2split == true) {
                    b1n = b1n / 2;
                    b2n = b1n;
                    b2split = false;
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
                else {
                    b2n = b2n + b1n;
                    b1n = 0;
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    [self freshGrid];
                }
            }
            if (b3if == true) {
                if (b2tower > 0) {
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    b2tower--;
                    if (b2tower == 0) {
                        b2n = 0;
                    }
                    b3n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b2split == true) {
                    b3n = b3n / 2;
                    b2n = b3n;
                    b2split = false;
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
                else {
                    b2n = b2n + b3n;
                    b3n = 0;
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    [self freshGrid];
                }
            }
            if (a3if == true) {
                if (b2tower > 0) {
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    b2tower--;
                    if (b2tower == 0) {
                        b2n = 0;
                    }
                    a3n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b2split == true) {
                    a3n = a3n / 2;
                    b2n = a3n;
                    b2split = false;
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
                else {
                    b2n = b2n + a3n;
                    a3n = 0;
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    [self freshGrid];
                }
            }
            if (c3if == true) {
                if (b2tower > 0) {
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    b2tower--;
                    if (b2tower == 0) {
                        b2n = 0;
                    }
                    c3n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b2split == true) {
                    c3n = c3n / 2;
                    b2n = c3n;
                    b2split = false;
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
                else {
                    b2n = b2n + c3n;
                    c3n = 0;
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    [self freshGrid];
                }
            }
            if (c2if == true) {
                if (b2tower > 0) {
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    b2tower--;
                    if (b2tower == 0) {
                        b2n = 0;
                    }
                    c2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b2split == true) {
                    c2n = c2n / 2;
                    b2n = c2n;
                    b2split = false;
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
                else {
                    b2n = b2n + c2n;
                    c2n = 0;
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    [self freshGrid];
                }
            }
            if (c1if == true) {
                if (b2tower > 0) {
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    b2tower--;
                    if (b2tower == 0) {
                        b2n = 0;
                    }
                    c1n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b2split == true) {
                    c1n = c1n / 2;
                    b2n = c1n;
                    b2split = false;
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
                else {
                    b2n = b2n + c1n;
                    c1n = 0;
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    [self freshGrid];
                }
            }
        }
    }
}
-(IBAction) b3a {
    if (animating == false) {
        if (b3if == true) {
            [self cancelGrid];
        }
        else {
            b3if = true;
            [self prepareForSelection];
            [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"selected-piece.png"]]];
            if (a2n < b3n && a2wall == false) {
                a2b.enabled = true;
            }
            if (a3n < b3n && a3wall == false) {
                a3b.enabled = true;
            }
            if (b2n < b3n && b2wall == false) {
                b2b.enabled = true;
            }
            if (c2n < b3n && c2wall == false) {
                c2b.enabled = true;
            }
            if (c3n < b3n && c3wall == false) {
                c3b.enabled = true;
            }
            
            //enable the button, so it can be tapped again to cancel out
            b3b.enabled = true;
            
            if (piecesDidAnimate == false) {
                [self animateTheDisabled];
            }
            
            if (a2if == true) {
                if (b3tower > 0) {
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    b3tower--;
                    if (b3tower == 0) {
                        b3n = 0;
                    }
                    a2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b3split == true) {
                    a2n = a2n / 2;
                    b3n = a2n;
                    b3split = false;
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    [self freshGrid];
                }
                else {
                    b3n = b3n + a2n;
                    a2n = 0;
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    a2l.text = [NSString stringWithFormat:@"%i", a2n];
                    [self freshGrid];
                }
            }
            if (b2if == true) {
                if (b3tower > 0) {
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    b3tower--;
                    if (b3tower == 0) {
                        b3n = 0;
                    }
                    b2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b3split == true) {
                    b2n = b2n / 2;
                    b3n = b2n;
                    b3split = false;
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    [self freshGrid];
                }
                else {
                    b3n = b3n + b2n;
                    b2n = 0;
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
            }
            if (a3if == true) {
                if (b3tower > 0) {
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    b3tower--;
                    if (b3tower == 0) {
                        b3n = 0;
                    }
                    a3n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b3split == true) {
                    a3n = a3n / 2;
                    b3n = a3n;
                    b3split = false;
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    [self freshGrid];
                }
                else {
                    b3n = b3n + a3n;
                    a3n = 0;
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    a3l.text = [NSString stringWithFormat:@"%i", a3n];
                    [self freshGrid];
                }
            }
            if (c3if == true) {
                if (b3tower > 0) {
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    b3tower--;
                    if (b3tower == 0) {
                        b3n = 0;
                    }
                    c3n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b3split == true) {
                    c3n = c3n / 2;
                    b3n = c3n;
                    b3split = false;
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    [self freshGrid];
                }
                else {
                    b3n = b3n + c3n;
                    c3n = 0;
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    [self freshGrid];
                }
            }
            if (c2if == true) {
                if (b3tower > 0) {
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    b3tower--;
                    if (b3tower == 0) {
                        b3n = 0;
                    }
                    c2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (b3split == true) {
                    c2n = c2n / 2;
                    b3n = c2n;
                    b3split = false;
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    [self freshGrid];
                }
                else {
                    b3n = b3n + c2n;
                    c2n = 0;
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    [self freshGrid];
                }
            }
        }
    }
}
-(IBAction) c1a {
    if (animating == false) {
        if (c1if == true) {
            [self cancelGrid];
        }
        else {
            c1if = true;
            [self prepareForSelection];
            [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"selected-piece.png"]]];
            if (b1n < c1n && b1wall == false) {
                b1b.enabled = true;
            }
            if (b2n < c1n && b2wall == false) {
                b2b.enabled = true;
            }
            if (c2n < c1n && c2wall == false) {
                c2b.enabled = true;
            }
            
            //enable the button, so it can be tapped again to cancel out
            c1b.enabled = true;
            
            if (piecesDidAnimate == false) {
                [self animateTheDisabled];
            }
            
            if (b1if == true) {
                if (c1tower > 0) {
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    c1tower--;
                    if (c1tower == 0) {
                        c1n = 0;
                    }
                    b1n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (c1split == true) {
                    b1n = b1n / 2;
                    c1n = b1n;
                    c1split = false;
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    [self freshGrid];
                }
                else {
                    c1n = c1n + b1n;
                    b1n = 0;
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    [self freshGrid];
                }
            }
            if (b2if == true) {
                if (c1tower > 0) {
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    c1tower--;
                    if (c1tower == 0) {
                        c1n = 0;
                    }
                    b2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (c1split == true) {
                    b2n = b2n / 2;
                    c1n = b2n;
                    c1split = false;
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    [self freshGrid];
                }
                else {
                    c1n = c1n + b2n;
                    b2n = 0;
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
            }
            if (c2if == true) {
                if (c1tower > 0) {
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    c1tower--;
                    if (c1tower == 0) {
                        c1n = 0;
                    }
                    c2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (c1split == true) {
                    c2n = c2n / 2;
                    c1n = c2n;
                    c1split = false;
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    [self freshGrid];
                }
                else {
                    c1n = c1n + c2n;
                    c2n = 0;
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    [self freshGrid];
                }
            }
        }
    }
}
-(IBAction) c2a {
    if (animating == false) {
        if (c2if == true) {
            [self cancelGrid];
        }
        else {
            c2if = true;
            [self prepareForSelection];
            [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"selected-piece.png"]]];
            if (b1n < c2n && b1wall == false) {
                b1b.enabled = true;
            }
            if (b2n < c2n && b2wall == false) {
                b2b.enabled = true;
            }
            if (b3n < c2n && b3wall == false) {
                b3b.enabled = true;
            }
            if (c1n < c2n && c1wall == false) {
                c1b.enabled = true;
            }
            if (c3n < c2n && c3wall == false) {
                c3b.enabled = true;
            }
            
            //enable the button, so it can be tapped again to cancel out
            c2b.enabled = true;
            
            if (piecesDidAnimate == false) {
                [self animateTheDisabled];
            }
            
            if (b1if == true) {
                if (c2tower > 0) {
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    c2tower--;
                    if (c2tower == 0) {
                        c2n = 0;
                    }
                    b1n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (c2split == true) {
                    b1n = b1n / 2;
                    c2n = b1n;
                    c2split = false;
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    [self freshGrid];
                }
                else {
                    c2n = c2n + b1n;
                    b1n = 0;
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    b1l.text = [NSString stringWithFormat:@"%i", b1n];
                    [self freshGrid];
                }
            }
            if (b2if == true) {
                if (c2tower > 0) {
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    c2tower--;
                    if (c2tower == 0) {
                        c2n = 0;
                    }
                    b2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (c2split == true) {
                    b2n = b2n / 2;
                    c2n = b2n;
                    c2split = false;
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    [self freshGrid];
                }
                else {
                    c2n = c2n + b2n;
                    b2n = 0;
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
            }
            if (b3if == true) {
                if (c2tower > 0) {
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    c2tower--;
                    if (c2tower == 0) {
                        c2n = 0;
                    }
                    b3n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (c2split == true) {
                    b3n = b3n / 2;
                    c2n = b3n;
                    c2split = false;
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    [self freshGrid];
                }
                else {
                    c2n = c2n + b3n;
                    b3n = 0;
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    [self freshGrid];
                }
            }
            if (c3if == true) {
                if (c2tower > 0) {
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    c2tower--;
                    if (c2tower == 0) {
                        c2n = 0;
                    }
                    c3n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (c2split == true) {
                    c3n = c3n / 2;
                    c2n = c3n;
                    c2split = false;
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    [self freshGrid];
                }
                else {
                    c2n = c2n + c3n;
                    c3n = 0;
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    [self freshGrid];
                }
            }
            if (c1if == true) {
                if (c2tower > 0) {
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    c2tower--;
                    if (c2tower == 0) {
                        c2n = 0;
                    }
                    c1n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (c2split == true) {
                    c1n = c1n / 2;
                    c2n = c1n;
                    c2split = false;
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    [self freshGrid];
                }
                else {
                    c2n = c2n + c1n;
                    c1n = 0;
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    c1l.text = [NSString stringWithFormat:@"%i", c1n];
                    [self freshGrid];
                }
            }
        }
    }
}
-(IBAction) c3a {
    if (animating == false) {
        if (c3if == true) {
            [self cancelGrid];
        }
        else {
            c3if = true;
            [self prepareForSelection];
            [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"selected-piece.png"]]];
            if (b2n < c3n && b2wall == false) {
                b2b.enabled = true;
            }
            if (b3n < c3n && b3wall == false) {
                b3b.enabled = true;
            }
            if (c2n < c3n && c2wall == false) {
                c2b.enabled = true;
            }
            
            //enable the button, so it can be tapped again to cancel out
            c3b.enabled = true;
            
            if (piecesDidAnimate == false) {
                [self animateTheDisabled];
            }
            
            if (b2if == true) {
                if (c3tower > 0) {
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    c3tower--;
                    if (c3tower == 0) {
                        c3n = 0;
                    }
                    b2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (c3split == true) {
                    b2n = b2n / 2;
                    c3n = b2n;
                    c3split = false;
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    [self freshGrid];
                }
                else {
                    c3n = c3n + b2n;
                    b2n = 0;
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    b2l.text = [NSString stringWithFormat:@"%i", b2n];
                    [self freshGrid];
                }
            }
            if (b3if == true) {
                if (c3tower > 0) {
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    c3tower--;
                    if (c3tower == 0) {
                        c3n = 0;
                    }
                    b3n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (c3split == true) {
                    b3n = b3n / 2;
                    c3n = b3n;
                    c3split = false;
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    [self freshGrid];
                }
                else {
                    c3n = c3n + b3n;
                    b3n = 0;
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    b3l.text = [NSString stringWithFormat:@"%i", b3n];
                    [self freshGrid];
                }
            }
            if (c2if == true) {
                if (c3tower > 0) {
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    c3tower--;
                    if (c3tower == 0) {
                        c3n = 0;
                    }
                    c2n = 0;
                    towers = towers - 1;
                    [self explodeSound];
                    [self freshGrid];
                }
                else if (c3split == true) {
                    c2n = c2n / 2;
                    c3n = c2n;
                    c3split = false;
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    [self freshGrid];
                }
                else {
                    c3n = c3n + c2n;
                    c2n = 0;
                    c3l.text = [NSString stringWithFormat:@"%i", c3n];
                    c2l.text = [NSString stringWithFormat:@"%i", c2n];
                    [self freshGrid];
                }
            }
        }
    }
}
-(IBAction)cancelGrid {
    if (animating == false) {
        [self snapSound];
        restartButton.hidden = false;
        cancelButton.hidden = true;
        piecesDidAnimate = false;
        
        [self animatePiecesTogether];
        
        a1if = false;
        a2if = false;
        a3if = false;
        b1if = false;
        b2if = false;
        b3if = false;
        c1if = false;
        c2if = false;
        c3if = false;
        
        a1b.enabled = true;
        a2b.enabled = true;
        a3b.enabled = true;
        b1b.enabled = true;
        b2b.enabled = true;
        b3b.enabled = true;
        c1b.enabled = true;
        c2b.enabled = true;
        c3b.enabled = true;
        
        [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        
        
        //if a1tower has value, assign proper identifier
        if (a1tower == 1) {
            [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            a1b.enabled = false;
        }
        else if (a1tower == 2) {
            [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
            a1b.enabled = false;
        }
        else if (a1tower > 2) {
            [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
            a1b.enabled = false;
        }
        //if a2tower has value, assign proper identifier
        if (a2tower == 1) {
            [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            a2b.enabled = false;
        }
        else if (a2tower == 2) {
            [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
            a2b.enabled = false;
        }
        else if (a2tower > 2) {
            [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
            a2b.enabled = false;
        }
        //if a3tower has value, assign proper identifier
        if (a3tower == 1) {
            [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            a3b.enabled = false;
        }
        else if (a3tower == 2) {
            [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
            a3b.enabled = false;
        }
        else if (a3tower > 2) {
            [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
            a3b.enabled = false;
        }
        //if b1tower has value, assign proper identifier
        if (b1tower == 1) {
            [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            b1b.enabled = false;
        }
        else if (b1tower == 2) {
            [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
            b1b.enabled = false;
        }
        else if (b1tower > 2) {
            [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
            b1b.enabled = false;
        }
        //if b2tower has value, assign proper identifier
        if (b2tower == 1) {
            [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            b2b.enabled = false;
        }
        else if (b2tower == 2) {
            [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
            b2b.enabled = false;
        }
        else if (b2tower > 2) {
            [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
            b2b.enabled = false;
        }
        //if b3tower has value, assign proper identifier
        if (b3tower == 1) {
            [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            b3b.enabled = false;
        }
        else if (b3tower == 2) {
            [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
            b3b.enabled = false;
        }
        else if (b3tower > 2) {
            [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
            b3b.enabled = false;
        }
        //if c1tower has value, assign proper identifier
        if (c1tower == 1) {
            [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            c1b.enabled = false;
        }
        else if (c1tower == 2) {
            [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
            c1b.enabled = false;
        }
        else if (c1tower > 2) {
            [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
            c1b.enabled = false;
        }
        //if c2tower has value, assign proper identifier
        if (c2tower == 1) {
            [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            c2b.enabled = false;
        }
        else if (c2tower == 2) {
            [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
            c2b.enabled = false;
        }
        else if (c2tower > 2) {
            [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
            c2b.enabled = false;
        }
        //if c3tower has value, assign proper identifier
        if (c3tower == 1) {
            [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            c3b.enabled = false;
        }
        else if (c3tower == 2) {
            [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-2.png"]]];
            c3b.enabled = false;
        }
        else if (c3tower > 2) {
            [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-3.png"]]];
            c3b.enabled = false;
        }
        
        if (a1split == true) {
            [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
        }
        if (a2split == true) {
            [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
        }
        if (a3split == true) {
            [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
        }
        if (b1split == true) {
            [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
        }
        if (b2split == true) {
            [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
        }
        if (b3split == true) {
            [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
        }
        if (c1split == true) {
            [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
        }
        if (c2split == true) {
            [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
        }
        if (c3split == true) {
            [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"split-piece.png"]]];
        }
        
        if (a1n == 0) {
            a1b.enabled = false;
            a1l.hidden = true;
        }
        if (a2n == 0) {
            a2b.enabled = false;
            a2l.hidden = true;
        }
        if (a3n == 0) {
            a3b.enabled = false;
            a3l.hidden = true;
        }
        if (b1n == 0) {
            b1b.enabled = false;
            b1l.hidden = true;
        }
        if (b2n == 0) {
            b2b.enabled = false;
            b2l.hidden = true;
        }
        if (b3n == 0) {
            b3b.enabled = false;
            b3l.hidden = true;
        }
        if (c1n == 0) {
            c1b.enabled = false;
            c1l.hidden = true;
        }
        if (c2n == 0) {
            c2b.enabled = false;
            c2l.hidden = true;
        }
        if (c3n == 0) {
            c3b.enabled = false;
            c3l.hidden = true;
        }
        
        if (a1n < 0) {
            a1b.enabled = false;
        }
        if (a2n < 0) {
            a2b.enabled = false;
        }
        if (a3n < 0) {
            a3b.enabled = false;
        }
        if (b1n < 0) {
            b1b.enabled = false;
        }
        if (b2n < 0) {
            b2b.enabled = false;
        }
        if (b3n < 0) {
            b3b.enabled = false;
        }
        if (c1n < 0) {
            c1b.enabled = false;
        }
        if (c2n < 0) {
            c2b.enabled = false;
        }
        if (c3n < 0) {
            c3b.enabled = false;
        }
        
        if (a1n != 0 && a1n > 0 && a1tower == 0) {
            a1b.enabled = true;
            a1l.hidden = false;
        }
        if (a2n != 0 && a2n > 0 && a2tower == 0) {
            a2b.enabled = true;
            a2l.hidden = false;
        }
        if (a3n != 0 && a3n > 0 && a3tower == 0) {
            a3b.enabled = true;
            a3l.hidden = false;
        }
        if (b1n != 0 && b1n > 0 && b1tower == 0) {
            b1b.enabled = true;
            b1l.hidden = false;
        }
        if (b2n != 0 && b2n > 0 && b2tower == 0) {
            b2b.enabled = true;
            b2l.hidden = false;
        }
        if (b3n != 0 && b3n > 0 && b3tower == 0) {
            b3b.enabled = true;
            b3l.hidden = false;
        }
        if (c1n != 0 && b1n > 0 && c1tower == 0) {
            c1b.enabled = true;
            c1l.hidden = false;
        }
        if (c2n != 0 && c2n > 0 && c2tower == 0) {
            c2b.enabled = true;
            c2l.hidden = false;
        }
        if (c3n != 0 && c3n > 0 && c3tower == 0) {
            c3b.enabled = true;
            c3l.hidden = false;
        }
        
        [self disableWalls];
        
        if (towers <= 0) {
            [self winLevel];
        }
    }
}

-(void)loadGridLabels {
    a1l.text = [NSString stringWithFormat:@"%i", a1n];
    a2l.text = [NSString stringWithFormat:@"%i", a2n];
    a3l.text = [NSString stringWithFormat:@"%i", a3n];
    b1l.text = [NSString stringWithFormat:@"%i", b1n];
    b2l.text = [NSString stringWithFormat:@"%i", b2n];
    b3l.text = [NSString stringWithFormat:@"%i", b3n];
    c1l.text = [NSString stringWithFormat:@"%i", c1n];
    c2l.text = [NSString stringWithFormat:@"%i", c2n];
    c3l.text = [NSString stringWithFormat:@"%i", c3n];
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    //if this value isn't current, you will not be able to load the latest levels
    levelsCount = 20;
    animationIntensity = 0.001;
    animationSpeed = 0.2;
    buttonRadius = 4;
    animating = false;
    
    //progress = [[NSUserDefaults standardUserDefaults] integerForKey:@"savedProgress"];
    progress = 20;
    
    l1pr = 0;
    l2pr = 0;
    l3pr = 0;
    l4pr = 0;
    l5pr = 0;
    l6pr = 0;
    l7pr = 0;
    l8pr = 0;
    l9pr = 0;
    l10pr = 0;
    l11pr = 0;
    l12pr = 0;
    l13pr = 0;
    l14pr = 0;
    l15pr = 0;
    l16pr = 0;
    l17pr = 0;
    l18pr = 0;
    l19pr = 0;
    l20pr = 0;
    
    [self loadProgress];
    
    //the game needs to begin in menu interface without some of the transforms done in menuInterface
    restartButton.hidden = true;
    cancelButton.hidden = true;
    levelSelectButton.hidden = true;
    interface = 0;
    
    endView.alpha = 0;
    evaluationView.alpha = 0;
    
    a1n = 0;
    a2n = 0;
    a3n = 0;
    b1n = 0;
    b2n = 0;
    b3n = 0;
    c1n = 0;
    c2n = 0;
    c3n = 0;
    
    a1if = false;
    a2if = false;
    a3if = false;
    b1if = false;
    b2if = false;
    b3if = false;
    c1if = false;
    c2if = false;
    c3if = false;
    
    a1j = [[jsJiggle alloc]initWithObject:a1i];
    a2j = [[jsJiggle alloc]initWithObject:a2i];
    a3j = [[jsJiggle alloc]initWithObject:a3i];
    b1j = [[jsJiggle alloc]initWithObject:b1i];
    b2j = [[jsJiggle alloc]initWithObject:b2i];
    b3j = [[jsJiggle alloc]initWithObject:b3i];
    c1j = [[jsJiggle alloc]initWithObject:c1i];
    c2j = [[jsJiggle alloc]initWithObject:c2i];
    c3j = [[jsJiggle alloc]initWithObject:c3i];
    
    evaluationView.clipsToBounds = NO;
    evaluationView.layer.shadowColor = [[UIColor blackColor] CGColor];
    evaluationView.layer.shadowOffset = CGSizeMake(0,0);
    evaluationView.layer.cornerRadius = buttonRadius;
    evaluationView.layer.shadowRadius = buttonRadius;
    evaluationView.layer.shadowOpacity = 0.2;
    evaluationView.layer.masksToBounds = NO;
    evaluationView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    evaluationView.layer.shouldRasterize = YES;
    
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:endBanner.bounds
                                     byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
                                           cornerRadii:CGSizeMake(3.0, 3.0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    evaluationView.layer.masksToBounds = NO;
    maskLayer.path = maskPath.CGPath;
    endBanner.layer.mask = maskLayer;
    
    currentLevel = 1;
    [self level:currentLevel];
    
    [super viewDidLoad];
}

-(IBAction)mainMenu {
    if (interface == 1) {
        [self levelSelect];
    }
    else {
        [self snapSound];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

-(IBAction)levelSelect {
    if (interface == 1) {
        [self snapSound];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        levelLabel.transform = CGAffineTransformMakeTranslation(0, -60);
        levelLabel.alpha = 0;
        descriptionLabel.transform = CGAffineTransformMakeTranslation(0, -60);
        descriptionLabel.alpha = 0;
        
        //evaluationView.alpha = 0;
        //headerView.transform = CGAffineTransformMakeTranslation(0, 0);
        //endView.alpha = 0;
        
        [UIView commitAnimations];
        
        [self performSelector:@selector(menuInterface) withObject:self afterDelay:animationSpeed];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.a1l = nil;
    self.a2l = nil;
    self.a3l = nil;
    self.b1l = nil;
    self.b2l = nil;
    self.b3l = nil;
    self.c1l = nil;
    self.c2l = nil;
    self.c3l = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end