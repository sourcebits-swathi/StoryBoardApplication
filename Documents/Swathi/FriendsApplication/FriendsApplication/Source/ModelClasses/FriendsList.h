//
//  FriendsList.h
//  FriendDetails
//
//  Created by Swathi Tata on 05/05/14.
//  Copyright (c) 2014 Swathi Tata. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendsList : NSObject

@property(nonatomic,retain)NSMutableArray *listOfFriends;

+(id)sharedInstance;
@end
