//
//  Editor_iPhone.m
//  Exponential Retaliation
//
//  Created by Danny Perski on 2/19/14.
//  Copyright (c) 2014 Danny Perski. All rights reserved.
//

#import "Editor_iPhone.h"

@interface Editor_iPhone ()

@end

@implementation Editor_iPhone

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
    editmode--;
    if(editmode < 1) {
        editmode = 4;
    }
    
    [self checkSelection];
    [self snapSound];
    
}

-(IBAction) switchRight {
    editmode++;
    if(editmode > 4) {
        editmode = 1;
    }
    
    [self checkSelection];
    [self snapSound];
}

-(IBAction) switchMode {
    gamemode++;
    
    if (gamemode > 1) {
        gamemode = 0;
    }
    
    [self prepareMode];
}

-(void)prepareMode {
    if(gamemode == 0) {
        gamemodeLabel.text = [NSString stringWithFormat:@"EDIT MODE"];
        
        a1b.enabled = true;
        a2b.enabled = true;
        a3b.enabled = true;
        b1b.enabled = true;
        b2b.enabled = true;
        b3b.enabled = true;
        c1b.enabled = true;
        c2b.enabled = true;
        c3b.enabled = true;
        
        leftButton.hidden = false;
        rightButton.hidden = false;
        editmodeLabel.hidden = false;
        cancelButton.hidden = true;
        restartButton.hidden = true;
    }
    if(gamemode == 1) {
        gamemodeLabel.text = [NSString stringWithFormat:@"PLAY MODE"];
        
        [self compileLevelData];
        
        leftButton.hidden = true;
        rightButton.hidden = true;
        editmodeLabel.hidden = true;
        cancelButton.hidden = true;
        restartButton.hidden = false;
    }
}

-(void)compileLevelData {
    
}

-(void)checkSelection {
    if(editmode == 1) {
        editmodeLabel.text = [NSString stringWithFormat:@"ADD"];
    }
    if(editmode == 2) {
        editmodeLabel.text = [NSString stringWithFormat:@"SUBTRACT"];
    }
    if(editmode == 3) {
        editmodeLabel.text = [NSString stringWithFormat:@"WALLS"];
    }
    if(editmode == 4) {
        editmodeLabel.text = [NSString stringWithFormat:@"TOWERS"];
    }
}

-(void)snapSound {
   // NSString *path = [[NSBundle mainBundle] pathForResource:@"finger_snap" ofType:@"wav"];
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

-(IBAction)retry {
    //[self level:currentLevel];
}

-(void)clearLevel {
    a1tower--;
    a2tower--;
    a3tower--;
    b1tower--;
    b2tower--;
    b3tower--;
    c1tower--;
    c2tower--;
    c3tower--;
    
    a1wall = false;
    a2wall = false;
    a3wall = false;
    b1wall = false;
    b2wall = false;
    b3wall = false;
    c1wall = false;
    c2wall = false;
    c3wall = false;
    
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
    
    if(a1n <= 0) {
        a1l.hidden = false;
    }
    if(a2n <= 0) {
        a2l.hidden = false;
    }
    if(a3n <= 0) {
        a3l.hidden = false;
    }
    if(b1n <= 0) {
        b1l.hidden = false;
    }
    if(b2n <= 0) {
        b2l.hidden = false;
    }
    if(b3n <= 0) {
        b3l.hidden = false;
    }
    if(c1n <= 0) {
        c1l.hidden = false;
    }
    if(c2n <= 0) {
        c2l.hidden = false;
    }
    if(c3n <= 0) {
        c3l.hidden = false;
    }
    
    towers = 0;
}

-(void)prepareForSelection {
    if (gamemode == 1) {
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
        
        restartButton.hidden = true;
        restartButton.enabled = false;
        cancelButton.hidden = false;
        cancelButton.enabled = true;
    }
}

-(void)freshGrid {
    if (gamemode == 0) {
        piecesDidAnimate = false;
        
        steps = steps + 1;
        
        //[self revertAnimation];
        
        a1l.text = [NSString stringWithFormat:@"%i", a1n];
        a2l.text = [NSString stringWithFormat:@"%i", a2n];
        a3l.text = [NSString stringWithFormat:@"%i", a3n];
        b1l.text = [NSString stringWithFormat:@"%i", b1n];
        b2l.text = [NSString stringWithFormat:@"%i", b2n];
        b3l.text = [NSString stringWithFormat:@"%i", b3n];
        c1l.text = [NSString stringWithFormat:@"%i", c1n];
        c2l.text = [NSString stringWithFormat:@"%i", c2n];
        c3l.text = [NSString stringWithFormat:@"%i", c3n];
        
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
        
        a1l.hidden = false;
        a2l.hidden = false;
        a3l.hidden = false;
        b1l.hidden = false;
        b2l.hidden = false;
        b3l.hidden = false;
        c1l.hidden = false;
        c2l.hidden = false;
        c3l.hidden = false;
        
        if(a1n <= 0) {
            a1l.hidden = true;
        }
        if(a2n <= 0) {
            a2l.hidden = true;
        }
        if(a3n <= 0) {
            a3l.hidden = true;
        }
        if(b1n <= 0) {
            b1l.hidden = true;
        }
        if(b2n <= 0) {
            b2l.hidden = true;
        }
        if(b3n <= 0) {
            b3l.hidden = true;
        }
        if(c1n <= 0) {
            c1l.hidden = true;
        }
        if(c2n <= 0) {
            c2l.hidden = true;
        }
        if(c3n <= 0) {
            c3l.hidden = true;
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
        
        if(a1tower == 1) {
            [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        }
        if(a2tower == 1) {
            [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        }
        if(a3tower == 1) {
            [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        }
        if(b1tower == 1) {
            [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        }
        if(b2tower == 1) {
            [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        }
        if(b3tower == 1) {
            [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        }
        if(c1tower == 1) {
            [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        }
        if(c2tower == 1) {
            [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        }
        if(c3tower == 1) {
            [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        }
        
        [self disableWalls];
        
        if(towers <= 0) {
            //[self winLevel];
        }
        
        if(interface == 1) {
            restartButton.hidden = false;
            restartButton.enabled = true;
            cancelButton.hidden = true;
            cancelButton.enabled = false;
        }
    }
    if (gamemode == 1) {
        piecesDidAnimate = false;
        
        steps = steps + 1;
        
        [self revertAnimation];
        
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
        if (c1n != 0 && c1n > 0 && c1tower == 0) {
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
        
        [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"open-piece.png"]]];
        
        if (a1tower == 1) {
            [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            a1b.enabled = false;
        }
        if (a2tower == 1) {
            [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            a2b.enabled = false;
        }
        if (a3tower == 1) {
            [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            a3b.enabled = false;
        }
        if (b1tower == 1) {
            [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            b1b.enabled = false;
        }
        if (b2tower == 1) {
            [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            b2b.enabled = false;
        }
        if (b3tower == 1) {
            [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            b3b.enabled = false;
        }
        if (c1tower == 1) {
            [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            c1b.enabled = false;
        }
        if (c2tower == 1) {
            [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            c2b.enabled = false;
        }
        if (c3tower == 1) {
            [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
            c3b.enabled = false;
        }
        
        [self disableWalls];
        
        if (towers <= 0) {
            //[self winLevel];
        }
        
        if (interface == 1) {
            restartButton.hidden = false;
            restartButton.enabled = true;
            cancelButton.hidden = true;
            cancelButton.enabled = false;
        }
    }
}

-(void)disableWalls {
    if(a1wall == true) {
        a1n = 0;
        [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        a1l.hidden = true;
    }
    if(a2wall == true) {
        a2n = 0;
        [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        a2l.hidden = true;
    }
    if(a3wall == true) {
        a3n = 0;
        [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        a3l.hidden = true;
    }
    if(b1wall == true) {
        b1n = 0;
        [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        b1l.hidden = true;
    }
    if(b2wall == true) {
        b2n = 0;
        [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        b2l.hidden = true;
    }
    if(b3wall == true) {
        b3n = 0;
        [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        b3l.hidden = true;
    }
    if(c1wall == true) {
        c1n = 0;
        [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        c1l.hidden = true;
    }
    if(c2wall == true) {
        c2n = 0;
        [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        c2l.hidden = true;
    }
    if(c3wall == true) {
        c3n = 0;
        [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"wall-piece.png"]]];
        c3l.hidden = true;
    }
}

-(void)animateTheDisabled {
    if(a1b.enabled == false && a1if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        a1i.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        a1l.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        
        [UIView commitAnimations];
    }
    if(a2b.enabled == false && a2if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        a2i.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        a2l.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        
        [UIView commitAnimations];
    }
    if(a3b.enabled == false && a3if == false) {
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        a3i.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        a3l.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        
        [UIView commitAnimations];
    }
    if(b1b.enabled == false && b1if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        b1i.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        b1l.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        
        [UIView commitAnimations];
    }
    if(b2b.enabled == false && b2if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        b2i.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        b2l.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        
        [UIView commitAnimations];
    }
    if(b3b.enabled == false && b3if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        b3i.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        b3l.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        
        [UIView commitAnimations];
    }
    if(c1b.enabled == false && c1if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        c1i.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        c1l.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        
        [UIView commitAnimations];
    }
    if(c2b.enabled == false && c2if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        c2i.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        c2l.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        
        [UIView commitAnimations];
    }
    if(c3b.enabled == false && c3if == false) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animationSpeed];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        
        c3i.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        c3l.transform = CGAffineTransformMakeScale(animationIntensity, animationIntensity);
        
        [UIView commitAnimations];
    }
    
    //[self startJiggle];
    
    piecesDidAnimate = true;
}

-(void)revertAnimation {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationSpeed];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    a1i.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    a2i.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    a3i.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    b1i.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    b2i.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    b3i.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    c1i.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    c2i.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    c3i.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    
    a1l.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    a2l.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    a3l.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    b1l.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    b2l.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    b3l.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    c1l.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    c2l.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    c3l.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    
    [UIView commitAnimations];
}

-(IBAction) a1a {
    if (gamemode == 0) {
        if(editmode == 1) {
            a1n++;
        }
        if(editmode == 2) {
            a1n--;
        }
        if(editmode == 3) {
            if(a1wall == false) {
                a1wall = true;
                a1tower--;
            }
            else {
                a1wall = false;
            }
        }
        if(editmode == 4) {
            if(a1tower == 0) {
                a1tower++;
                if (a1n == 0) {
                    a1n++;
                }
            }
            else {
                a1tower--;
            }
        }
        [self freshGrid];
    }
    if(gamemode == 1) {
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
        
        if (piecesDidAnimate == false) {
            [self animateTheDisabled];
        }
        
        if (a2if == true) {
            a1n = a1n + a2n;
            a2n = 0;
            a1l.text = [NSString stringWithFormat:@"%i", a1n];
            a2l.text = [NSString stringWithFormat:@"%i", a2n];
            [self freshGrid];
            if (a1tower == 1) {
                a1n = 0;
                a1l.text = [NSString stringWithFormat:@"%i", a1n];
                a1tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        
        if (b1if == true) {
            a1n = a1n + b1n;
            b1n = 0;
            a1l.text = [NSString stringWithFormat:@"%i", a1n];
            b1l.text = [NSString stringWithFormat:@"%i", b1n];
            [self freshGrid];
            if (a1tower == 1) {
                a1n = 0;
                a1l.text = [NSString stringWithFormat:@"%i", a1n];
                a1tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        
        if (b2if == true) {
            a1n = a1n + b2n;
            b2n = 0;
            a1l.text = [NSString stringWithFormat:@"%i", a1n];
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            [self freshGrid];
            if (a1tower == 1) {
                a1n = 0;
                a1l.text = [NSString stringWithFormat:@"%i", a1n];
                a1tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        
        else {
            
        }
    }
}

-(IBAction) a2a {
    if (gamemode == 0) {
        if(editmode == 1) {
            a2n++;
        }
        if(editmode == 2) {
            a2n--;
        }
        if(editmode == 3) {
            if(a2wall == false) {
                a2wall = true;
                a2tower--;
            }
            else {
                a2wall = false;
            }
        }
        if(editmode == 4) {
            if(a2tower == 0) {
                a2tower++;
                if (a2n == 0) {
                    a2n++;
                }
            }
            else {
                a2tower--;
            }
        }
        [self freshGrid];
    }
    if (gamemode == 1) {
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
        
        if (piecesDidAnimate == false) {
            [self animateTheDisabled];
        }
        
        if (a1if == true) {
            a2n = a2n + a1n;
            a1n = 0;
            a1l.text = [NSString stringWithFormat:@"%i", a1n];
            a2l.text = [NSString stringWithFormat:@"%i", a2n];
            [self freshGrid];
            if (a2tower == 1) {
                a2n = 0;
                a2l.text = [NSString stringWithFormat:@"%i", a2n];
                a2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (b1if == true) {
            a2n = a2n + b1n;
            b1n = 0;
            a2l.text = [NSString stringWithFormat:@"%i", a2n];
            b1l.text = [NSString stringWithFormat:@"%i", b1n];
            [self freshGrid];
            if (a2tower == 1) {
                a2n = 0;
                a2l.text = [NSString stringWithFormat:@"%i", a2n];
                a2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (b2if == true) {
            a2n = a2n + b2n;
            b2n = 0;
            a2l.text = [NSString stringWithFormat:@"%i", a2n];
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            [self freshGrid];
            if (a2tower == 1) {
                a2n = 0;
                a2l.text = [NSString stringWithFormat:@"%i", a2n];
                a2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (b3if == true) {
            a2n = a2n + b3n;
            b3n = 0;
            a2l.text = [NSString stringWithFormat:@"%i", a2n];
            b3l.text = [NSString stringWithFormat:@"%i", b3n];
            [self freshGrid];
            if (a2tower == 1) {
                a2n = 0;
                a2l.text = [NSString stringWithFormat:@"%i", a2n];
                a2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (a3if == true) {
            a2n = a2n + a3n;
            a3n = 0;
            a2l.text = [NSString stringWithFormat:@"%i", a2n];
            a3l.text = [NSString stringWithFormat:@"%i", a3n];
            [self freshGrid];
            if (a2tower == 1) {
                a2n = 0;
                a2l.text = [NSString stringWithFormat:@"%i", a2n];
                a2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
    }
}

-(IBAction) a3a {
    if (gamemode == 0) {
        if(editmode == 1) {
            a3n++;
        }
        if(editmode == 2) {
            a3n--;
        }
        if(editmode == 3) {
            if(a3wall == false) {
                a3wall = true;
                a3tower--;
            }
            else {
                a3wall = false;
            }
        }
        if(editmode == 4) {
            if(a3tower == 0) {
                a3tower++;
                if (a3n == 0) {
                    a3n++;
                }
            }
            else {
                a3tower--;
            }
        }
        [self freshGrid];
    }
    if(gamemode == 1) {
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
        
        if (piecesDidAnimate == false) {
            [self animateTheDisabled];
        }
        
        if (a2if == true) {
            a3n = a3n + a2n;
            a2n = 0;
            a3l.text = [NSString stringWithFormat:@"%i", a3n];
            a2l.text = [NSString stringWithFormat:@"%i", a2n];
            [self freshGrid];
            if (a3tower == 1) {
                a3n = 0;
                a3l.text = [NSString stringWithFormat:@"%i", a3n];
                a3tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        
        if (b2if == true) {
            a3n = a3n + b2n;
            b2n = 0;
            a3l.text = [NSString stringWithFormat:@"%i", a3n];
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            [self freshGrid];
            if (a3tower == 1) {
                a3n = 0;
                a3l.text = [NSString stringWithFormat:@"%i", a3n];
                a3tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (b3if == true) {
            a3n = a3n + b3n;
            b3n = 0;
            a3l.text = [NSString stringWithFormat:@"%i", a3n];
            b3l.text = [NSString stringWithFormat:@"%i", b3n];
            [self freshGrid];
            if (a3tower == 1) {
                a3n = 0;
                a3l.text = [NSString stringWithFormat:@"%i", a3n];
                a3tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
    }
}

-(IBAction) b1a {
    if (gamemode == 0) {
        if(editmode == 1) {
            b1n++;
        }
        if(editmode == 2) {
            b1n--;
        }
        if(editmode == 3) {
            if(b1wall == false) {
                b1wall = true;
                b1tower--;
            }
            else {
                b1wall = false;
            }
        }
        if(editmode == 4) {
            if(b1tower == 0) {
                b1tower++;
                if (b1n == 0) {
                    b1n++;
                }
            }
            else {
                b1tower--;
            }
        }
        [self freshGrid];
    }
    if (gamemode == 1) {
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
        
        if (piecesDidAnimate == false) {
            [self animateTheDisabled];
        }
        
        if (a1if == true) {
            b1n = b1n + a1n;
            a1n = 0;
            a1l.text = [NSString stringWithFormat:@"%i", a1n];
            b1l.text = [NSString stringWithFormat:@"%i", b1n];
            [self freshGrid];
            if (b1tower == 1) {
                b1n = 0;
                b1l.text = [NSString stringWithFormat:@"%i", b1n];
                b1tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (a2if == true) {
            b1n = b1n + a2n;
            a2n = 0;
            b1l.text = [NSString stringWithFormat:@"%i", b1n];
            a2l.text = [NSString stringWithFormat:@"%i", a2n];
            [self freshGrid];
            if (b1tower == 1) {
                b1n = 0;
                b1l.text = [NSString stringWithFormat:@"%i", b1n];
                b1tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (b2if == true) {
            b1n = b1n + b2n;
            b2n = 0;
            b1l.text = [NSString stringWithFormat:@"%i", b1n];
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            [self freshGrid];
            if (b1tower == 1) {
                b1n = 0;
                b1l.text = [NSString stringWithFormat:@"%i", b1n];
                b1tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (c2if == true) {
            b1n = b1n + c2n;
            c2n = 0;
            b1l.text = [NSString stringWithFormat:@"%i", b1n];
            c2l.text = [NSString stringWithFormat:@"%i", c2n];
            [self freshGrid];
            if (b1tower == 1) {
                b1n = 0;
                b1l.text = [NSString stringWithFormat:@"%i", b1n];
                b1tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (c1if == true) {
            b1n = b1n + c1n;
            c1n = 0;
            b1l.text = [NSString stringWithFormat:@"%i", b1n];
            c1l.text = [NSString stringWithFormat:@"%i", c1n];
            [self freshGrid];
            if (b1tower == 1) {
                b1n = 0;
                b1l.text = [NSString stringWithFormat:@"%i", b1n];
                b1tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
    }
}

-(IBAction) b2a {
    if (gamemode == 0) {
        if(editmode == 1) {
            b2n++;
        }
        if(editmode == 2) {
            b2n--;
        }
        if(editmode == 3) {
            if(b2wall == false) {
                b2wall = true;
                b2tower--;
            }
            else {
                b2wall = false;
            }
        }
        if(editmode == 4) {
            if(b2tower == 0) {
                b2tower++;
                if (b2n == 0) {
                    b2n++;
                }
            }
            else {
                b2tower--;
            }
        }
        [self freshGrid];
    }
    if (gamemode == 1) {
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
        
        if (piecesDidAnimate == false) {
            [self animateTheDisabled];
        }
        
        if (a1if == true) {
            piecesDidAnimate = false;
            b2n = b2n + a1n;
            a1n = 0;
            a1l.text = [NSString stringWithFormat:@"%i", a1n];
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            [self freshGrid];
            if (b2tower == 1) {
                b2n = 0;
                b2l.text = [NSString stringWithFormat:@"%i", b2n];
                b2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (a2if == true) {
            piecesDidAnimate = false;
            b2n = b2n + a2n;
            a2n = 0;
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            a2l.text = [NSString stringWithFormat:@"%i", a2n];
            [self freshGrid];
            if (b2tower == 1) {
                b2n = 0;
                b2l.text = [NSString stringWithFormat:@"%i", b2n];
                b2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (b1if == true) {
            piecesDidAnimate = false;
            b2n = b2n + b1n;
            b1n = 0;
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            b1l.text = [NSString stringWithFormat:@"%i", b1n];
            [self freshGrid];
            if (b2tower == 1) {
                b2n = 0;
                b2l.text = [NSString stringWithFormat:@"%i", b2n];
                b2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (b3if == true) {
            piecesDidAnimate = false;
            b2n = b2n + b3n;
            b3n = 0;
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            b3l.text = [NSString stringWithFormat:@"%i", b3n];
            [self freshGrid];
            if (b2tower == 1) {
                b2n = 0;
                b2l.text = [NSString stringWithFormat:@"%i", b2n];
                b2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (a3if == true) {
            piecesDidAnimate = false;
            b2n = b2n + a3n;
            a3n = 0;
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            a3l.text = [NSString stringWithFormat:@"%i", a3n];
            [self freshGrid];
            if (b2tower == 1) {
                b2n = 0;
                b2l.text = [NSString stringWithFormat:@"%i", b2n];
                b2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (c3if == true) {
            piecesDidAnimate = false;
            b2n = b2n + c3n;
            c3n = 0;
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            c3l.text = [NSString stringWithFormat:@"%i", c3n];
            [self freshGrid];
            if (b2tower == 1) {
                b2n = 0;
                b2l.text = [NSString stringWithFormat:@"%i", b2n];
                b2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (c2if == true) {
            piecesDidAnimate = false;
            b2n = b2n + c2n;
            c2n = 0;
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            c2l.text = [NSString stringWithFormat:@"%i", c2n];
            [self freshGrid];
            if (b2tower == 1) {
                b2n = 0;
                b2l.text = [NSString stringWithFormat:@"%i", b2n];
                b2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (c1if == true) {
            piecesDidAnimate = false;
            b2n = b2n + c1n;
            c1n = 0;
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            c1l.text = [NSString stringWithFormat:@"%i", c1n];
            [self freshGrid];
            if (b2tower == 1) {
                b2n = 0;
                b2l.text = [NSString stringWithFormat:@"%i", b2n];
                b2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
    }
}

-(IBAction) b3a {
    if (gamemode == 0) {
        if(editmode == 1) {
            b3n++;
        }
        if(editmode == 2) {
            b3n--;
        }
        if(editmode == 3) {
            if(b3wall == false) {
                b3wall = true;
                b3tower--;
            }
            else {
                b3wall = false;
            }
        }
        if(editmode == 4) {
            if(b3tower == 0) {
                b3tower++;
                if (b3n == 0) {
                    b3n++;
                }
            }
            else {
                b3tower--;
                
            }
        }
        [self freshGrid];
    }
    if (gamemode == 1) {
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
        
        if (piecesDidAnimate == false) {
            [self animateTheDisabled];
        }
        
        if (a2if == true) {
            b3n = b3n + a2n;
            a2n = 0;
            b3l.text = [NSString stringWithFormat:@"%i", b3n];
            a2l.text = [NSString stringWithFormat:@"%i", a2n];
            [self freshGrid];
            if (b3tower == 1) {
                b3n = 0;
                b3l.text = [NSString stringWithFormat:@"%i", b3n];
                b3tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (b2if == true) {
            b3n = b3n + b2n;
            b2n = 0;
            b3l.text = [NSString stringWithFormat:@"%i", b3n];
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            [self freshGrid];
            if (b3tower == 1) {
                b3n = 0;
                b3l.text = [NSString stringWithFormat:@"%i", b3n];
                b3tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (a3if == true) {
            b3n = b3n + a3n;
            a3n = 0;
            b3l.text = [NSString stringWithFormat:@"%i", b3n];
            a3l.text = [NSString stringWithFormat:@"%i", a3n];
            [self freshGrid];
            if (b3tower == 1) {
                b3n = 0;
                b3l.text = [NSString stringWithFormat:@"%i", b3n];
                b3tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (c3if == true) {
            b3n = b3n + c3n;
            c3n = 0;
            b3l.text = [NSString stringWithFormat:@"%i", b3n];
            c3l.text = [NSString stringWithFormat:@"%i", c3n];
            [self freshGrid];
            if (b3tower == 1) {
                b3n = 0;
                b3l.text = [NSString stringWithFormat:@"%i", b3n];
                b3tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (c2if == true) {
            b3n = b3n + c2n;
            c2n = 0;
            b3l.text = [NSString stringWithFormat:@"%i", b3n];
            c2l.text = [NSString stringWithFormat:@"%i", c2n];
            [self freshGrid];
            if (b3tower == 1) {
                b3n = 0;
                b3l.text = [NSString stringWithFormat:@"%i", b3n];
                b3tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
    }
}

-(IBAction) c1a {
    if (gamemode == 0) {
        if(editmode == 1) {
            c1n++;
        }
        if(editmode == 2) {
            c1n--;
        }
        if(editmode == 3) {
            if(c1wall == false) {
                c1wall = true;
                c1tower--;
            }
            else {
                c1wall = false;
            }
        }
        if(editmode == 4) {
            if(c1tower == 0) {
                c1tower++;
                if (c1n == 0) {
                    c1n++;
                }
            }
            else {
                c1tower--;
            }
        }
        [self freshGrid];
    }
    if (gamemode == 1) {
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
        
        if (piecesDidAnimate == false) {
            [self animateTheDisabled];
        }
        
        if (b1if == true) {
            c1n = c1n + b1n;
            b1n = 0;
            c1l.text = [NSString stringWithFormat:@"%i", c1n];
            b1l.text = [NSString stringWithFormat:@"%i", b1n];
            [self freshGrid];
            if (c1tower == 1) {
                c1n = 0;
                c1l.text = [NSString stringWithFormat:@"%i", c1n];
                c1tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (b2if == true) {
            c1n = c1n + b2n;
            b2n = 0;
            c1l.text = [NSString stringWithFormat:@"%i", c1n];
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            [self freshGrid];
            if (c1tower == 1) {
                c1n = 0;
                c1l.text = [NSString stringWithFormat:@"%i", c1n];
                c1tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (c2if == true) {
            c1n = c1n + c2n;
            c2n = 0;
            c1l.text = [NSString stringWithFormat:@"%i", c1n];
            c2l.text = [NSString stringWithFormat:@"%i", c2n];
            [self freshGrid];
            if (c1tower == 1) {
                c1n = 0;
                c1l.text = [NSString stringWithFormat:@"%i", c1n];
                c1tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
    }
}

-(IBAction) c2a {
    if (gamemode == 0) {
        if(editmode == 1) {
            c2n++;
        }
        if(editmode == 2) {
            c2n--;
        }
        if(editmode == 3) {
            if(c2wall == false) {
                c2wall = true;
                c2tower--;
            }
            else {
                c2wall = false;
            }
        }
        if(editmode == 4) {
            if(c2tower == 0) {
                c2tower++;
                if (c2n == 0) {
                    c2n++;
                }
            }
            else {
                c2tower--;
            }
        }
        [self freshGrid];
    }
    if (gamemode == 1) {
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
        
        if (piecesDidAnimate == false) {
            [self animateTheDisabled];
        }
        
        if (b1if == true) {
            c2n = c2n + b1n;
            b1n = 0;
            c2l.text = [NSString stringWithFormat:@"%i", c2n];
            b1l.text = [NSString stringWithFormat:@"%i", b1n];
            [self freshGrid];
            if (c2tower == 1) {
                c2n = 0;
                c2l.text = [NSString stringWithFormat:@"%i", c2n];
                c2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (b2if == true) {
            c2n = c2n + b2n;
            b2n = 0;
            c2l.text = [NSString stringWithFormat:@"%i", c2n];
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            [self freshGrid];
            if (c2tower == 1) {
                c2n = 0;
                c2l.text = [NSString stringWithFormat:@"%i", c2n];
                c2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (b3if == true) {
            c2n = c2n + b3n;
            b3n = 0;
            c2l.text = [NSString stringWithFormat:@"%i", c2n];
            b3l.text = [NSString stringWithFormat:@"%i", b3n];
            [self freshGrid];
            if (c2tower == 1) {
                c2n = 0;
                c2l.text = [NSString stringWithFormat:@"%i", c2n];
                c2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (c3if == true) {
            c2n = c2n + c3n;
            c3n = 0;
            c2l.text = [NSString stringWithFormat:@"%i", c2n];
            c3l.text = [NSString stringWithFormat:@"%i", c3n];
            [self freshGrid];
            if (c2tower == 1) {
                c2n = 0;
                c2l.text = [NSString stringWithFormat:@"%i", c2n];
                c2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (c1if == true) {
            c2n = c2n + c1n;
            c1n = 0;
            c2l.text = [NSString stringWithFormat:@"%i", c2n];
            c1l.text = [NSString stringWithFormat:@"%i", c1n];
            [self freshGrid];
            if (c2tower == 1) {
                c2n = 0;
                c2l.text = [NSString stringWithFormat:@"%i", c2n];
                c2tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
    }
}

-(IBAction) c3a {
    if (gamemode == 0) {
        if(editmode == 1) {
            c3n++;
        }
        if(editmode == 2) {
            c3n--;
        }
        if(editmode == 3) {
            if(c3wall == false) {
                c3wall = true;
                c3tower--;
            }
            else {
                c3wall = false;
            }
        }
        if(editmode == 4) {
            if(c3tower == 0) {
                c3tower++;
                if (c3n == 0) {
                    c3n++;
                }
            }
            else {
                c3tower--;
            }
        }
        [self freshGrid];
    }
    if (gamemode == 1) {
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
        
        if (piecesDidAnimate == false) {
            [self animateTheDisabled];
        }
        
        if (b2if == true) {
            c3n = c3n + b2n;
            b2n = 0;
            c3l.text = [NSString stringWithFormat:@"%i", c3n];
            b2l.text = [NSString stringWithFormat:@"%i", b2n];
            [self freshGrid];
            if (c3tower == 1) {
                c3n = 0;
                c3l.text = [NSString stringWithFormat:@"%i", c3n];
                c3tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (b3if == true) {
            c3n = c3n + b3n;
            b3n = 0;
            c3l.text = [NSString stringWithFormat:@"%i", c3n];
            b3l.text = [NSString stringWithFormat:@"%i", b3n];
            [self freshGrid];
            if (c3tower == 1) {
                c3n = 0;
                c3l.text = [NSString stringWithFormat:@"%i", c3n];
                c3tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
        if (c2if == true) {
            c3n = c3n + c2n;
            c2n = 0;
            c3l.text = [NSString stringWithFormat:@"%i", c3n];
            c2l.text = [NSString stringWithFormat:@"%i", c2n];
            [self freshGrid];
            if (c3tower == 1) {
                c3n = 0;
                c3l.text = [NSString stringWithFormat:@"%i", c3n];
                c3tower--;
                towers = towers - 1;
                [self explodeSound];
                [self freshGrid];
            }
        }
    }
}

-(IBAction)cancelGrid {
    [self snapSound];
    restartButton.hidden = false;
    restartButton.enabled = true;
    cancelButton.hidden = true;
    cancelButton.enabled = false;
    piecesDidAnimate = false;
    
    [self revertAnimation];
    
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
    
    if (a1tower == 1) {
        [a1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        a1b.enabled = false;
    }
    if (a2tower == 1) {
        [a2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        a2b.enabled = false;
    }
    if (a3tower == 1) {
        [a3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        a3b.enabled = false;
    }
    if (b1tower == 1) {
        [b1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        b1b.enabled = false;
    }
    if (b2tower == 1) {
        [b2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        b2b.enabled = false;
    }
    if (b3tower == 1) {
        [b3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        b3b.enabled = false;
    }
    if (c1tower == 1) {
        [c1i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        c1b.enabled = false;
    }
    if (c2tower == 1) {
        [c2i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        c2b.enabled = false;
    }
    if (c3tower == 1) {
        [c3i setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tower-piece-1.png"]]];
        c3b.enabled = false;
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
        //[self winLevel];
    }
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    levelsCount = 10;
    
    animationIntensity = 0.0;
    animationSpeed = 0.2;
    editmode = 1;
    gamemode = 0;
    
    //progress = [[NSUserDefaults standardUserDefaults] integerForKey:@"savedProgress"];
    
    //[self loadProgress];
    
    //[self menuInterface];
    
    endView.hidden = true;
    
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
    
    /*
    a1j = [[jsJiggle alloc]initWithObject:a1i];
    a2j = [[jsJiggle alloc]initWithObject:a2i];
    a3j = [[jsJiggle alloc]initWithObject:a3i];
    b1j = [[jsJiggle alloc]initWithObject:b1i];
    b2j = [[jsJiggle alloc]initWithObject:b2i];
    b3j = [[jsJiggle alloc]initWithObject:b3i];
    c1j = [[jsJiggle alloc]initWithObject:c1i];
    c2j = [[jsJiggle alloc]initWithObject:c2i];
    c3j = [[jsJiggle alloc]initWithObject:c3i];
    */
    
    currentLevel = 1;
    [self freshGrid];
    
    [super viewDidLoad];
}

-(IBAction)mainMenu {
    [self snapSound];
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(IBAction)levelSelect {
    [self snapSound];
    //[self menuInterface];
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