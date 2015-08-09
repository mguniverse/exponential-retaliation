//
//  ViewController.m
//  Exponential Retaliation
//
//  Created by Danny Perski on 12/6/13.
//  Copyright (c) 2013 Danny Perski. All rights reserved.
//

#import "ViewController.h"
#import "Levels_iPhone.h"
#import "Editor_iPhone.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)startGame {
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

- (void)viewDidLoad
{
    buttonRadius = 10;
    nucleus = [[jsJiggle alloc]initWithObject:nucleusImage];
    isJiggling = false;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
