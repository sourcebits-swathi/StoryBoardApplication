//
//  FDDetailedViewController.m
//  FriendDetails
//
//  Created by Swathi Tata on 05/05/14.
//  Copyright (c) 2014 Swathi Tata. All rights reserved.
//

#import "FDDetailedViewController.h"
#import "FDPickPhotoViewController.h"
#import "FriendsList.h"
#import "Constants.h"

@interface FDDetailedViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *profileNameTf;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectPhotoButton;
//To store friend name before editing because by using this i am saving friend profile photo,if in case the friend name is changed i need to  move it to new path by taking new friends name
@property(retain,nonatomic)NSString *friendnameBeforeEditing;

@end

@implementation FDDetailedViewController
@synthesize descriptionText,friendName,friendnameBeforeEditing;
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
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.profileNameTf.text = friendName;
    self.descriptionLabel.text = descriptionText;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //Getting the image from document directory
    NSString *imagePath = [NSString stringWithFormat:@"%@/%@", getDocumentDirectory(), [NSString stringWithFormat:@"%@.png",self.profileNameTf.text]];
    
    UIImage *profileImage = [UIImage imageWithContentsOfFile:imagePath];
    if (profileImage != nil) {
        
        [self.selectPhotoButton setTitle:@"" forState:UIControlStateNormal];
    }
    
    self.profileImage.image = [UIImage imageWithContentsOfFile:imagePath];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - for app state preservation
-(void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.profileNameTf.text forKey:@"ProfileName"];
    [coder encodeObject:self.descriptionLabel.text forKey:@"Description"];
    if (self.profileImage!= nil) {
        
        [coder encodeObject:self.profileImage.image forKey:@"ProfileImage"];
    }
    [super encodeRestorableStateWithCoder:coder];
}
#pragma mark - for app state restore
-(void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    self.profileNameTf.text = [coder decodeObjectForKey:@"ProfileName"];
    self.descriptionLabel.text = [coder decodeObjectForKey:@"Description"];
    if ([coder decodeObjectForKey:@"ProfileImage"]!=nil) {
        
        self.profileImage.image =[coder decodeObjectForKey:@"ProfileImage"];
    }
    [super decodeRestorableStateWithCoder:coder];
}
#pragma mark - UITextField Delegate Methods
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.friendnameBeforeEditing = self.profileNameTf.text;

    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.friendnameBeforeEditing = self.profileNameTf.text;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{

    FriendsList *data = [FriendsList sharedInstance];
    [[data.listOfFriends objectAtIndex:self.selectedrow]setObject:self.profileNameTf.text forKey:@"name"];
    
    NSError * err = NULL;
    NSFileManager * fileManager = [[NSFileManager alloc] init];
    //With changed friend name moving the image to new path
 
    NSString *destinationImagePath = [NSString stringWithFormat:@"%@/%@", getDocumentDirectory(), [NSString stringWithFormat:@"%@.png",self.profileNameTf.text]];
    
    //Taking the source image path(before editing)
    
    NSString *sourceImagePath = [NSString stringWithFormat:@"%@/%@", getDocumentDirectory(), [NSString stringWithFormat:@"%@.png",self.friendnameBeforeEditing]];
    
    if ([fileManager fileExistsAtPath:sourceImagePath])
    {
        
        BOOL result = [fileManager moveItemAtPath:sourceImagePath toPath:destinationImagePath error:&err];
        if(!result)
            NSLog(@"Error: %@", err);
    }

  
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark - Moving to Detailed View Controller

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    FDPickPhotoViewController *pickPhotoViewCtrl = [segue destinationViewController];
    
    pickPhotoViewCtrl.profilePicName =self.profileNameTf.text;
    
    
}

@end
