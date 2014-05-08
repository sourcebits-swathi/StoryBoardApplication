//
//  ViewController.m
//  AutoresizeDemo
//
//  Created by Swathi Tata on 29/04/14.
//  Copyright (c) 2014 Swathi Tata. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//creating buttons
@property (weak, nonatomic) IBOutlet UIButton *cancel_btn;
@property (weak, nonatomic) IBOutlet UIButton *ok_btn;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)cancelButtonAction:(id)sender
{
    
}
- (IBAction)okButtonAction:(id)sender
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
