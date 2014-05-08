//
//  FDPickPhotoViewController.m
//  FriendDetails
//
//  Created by Swathi Tata on 05/05/14.
//  Copyright (c) 2014 Swathi Tata. All rights reserved.
//

#import "FDPickPhotoViewController.h"
#import "Constants.h"

@interface FDPickPhotoViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    UIImagePickerController *imagePicker;
}

@end

@implementation FDPickPhotoViewController
@synthesize profilePicName;
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
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - pickPhoto Action
- (IBAction)photoAction:(id)sender
{
    imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePicker.delegate = self;
    [self.view addSubview:imagePicker.view];

}
#pragma mark - pickvideo Action
- (IBAction)PckvideoAction:(id)sender
{
    
}

#pragma mark - UIImagePickerControllerDelegate

// This method is called when an image has been chosen from the library 
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
   
    //Saving image name as concatenating document directory path + friend name with the extension of png
    
    NSString *imagePath = [NSString stringWithFormat:@"%@/%@", getDocumentDirectory(), [NSString stringWithFormat:@"%@.png",profilePicName]];
    NSData *imagedata = UIImageJPEGRepresentation(image, 1.0);
    
    [imagedata writeToFile:imagePath atomically:YES];
    
    [imagePicker.view removeFromSuperview];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    

    
    

}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}



@end
