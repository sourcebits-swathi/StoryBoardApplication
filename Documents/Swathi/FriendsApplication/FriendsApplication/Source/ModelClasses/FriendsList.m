//
//  FriendsList.m
//  FriendDetails
//
//  Created by Swathi Tata on 05/05/14.
//  Copyright (c) 2014 Swathi Tata. All rights reserved.
//

#import "FriendsList.h"

@implementation FriendsList

static FriendsList *sharedInstance = nil;
@synthesize listOfFriends;

-(id)init
{
    self = [super init];
  
    if (self) {
        
        [self feedingAllInformation];
    }
    
    return self;
}
+(FriendsList *)sharedInstance
{
    if (sharedInstance == nil) {
        
        sharedInstance = [[self alloc]init];
    }
    
    return sharedInstance;
}
-(void)feedingAllInformation
{
    self.listOfFriends = [NSMutableArray array];
    
    [self.listOfFriends addObject:[[NSMutableDictionary alloc]initWithObjects:@[@"Swathi",@"Lives in Bangalore"] forKeys:@[@"name",@"where the person stays"]]];
     [self.listOfFriends addObject:[[NSMutableDictionary alloc]initWithObjects:@[@"Taj",@"Lives in Tamilnadu"] forKeys:@[@"name",@"where the person stays"]]];
     [self.listOfFriends addObject:[[NSMutableDictionary alloc]initWithObjects:@[@"Neha",@"Lives in UK"] forKeys:@[@"name",@"where the person stays"]]];
     [self.listOfFriends addObject:[[NSMutableDictionary alloc]initWithObjects:@[@"Hayathi",@"Lives in USA"] forKeys:@[@"name",@"where the person stays"]]];
     [self.listOfFriends addObject:[[NSMutableDictionary alloc]initWithObjects:@[@"Sneha",@"Lives in Pune"] forKeys:@[@"name",@"where the person stays"]]];
    
    NSLog(@"list of friends %@",self.listOfFriends);
}
@end
