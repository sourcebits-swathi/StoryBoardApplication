//
//  FDDetailedViewController.h
//  FriendDetails
//
//  Created by Swathi Tata on 05/05/14.
//  Copyright (c) 2014 Swathi Tata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDDetailedViewController : UIViewController

@property(nonatomic,retain)NSString *descriptionText;
@property(nonatomic,retain)NSString *friendName;
//To update data of a particular person in data class
@property(nonatomic,assign)int selectedrow;
@end
