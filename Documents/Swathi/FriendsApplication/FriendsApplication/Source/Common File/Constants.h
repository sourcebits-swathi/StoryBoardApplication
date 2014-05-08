//
//  Constants.h
//  FriendDetails
//
//  Created by Swathi Tata on 06/05/14.
//  Copyright (c) 2014 Swathi Tata. All rights reserved.
//


#pragma mark - Getting Document Directory Path
static inline  NSString * getDocumentDirectory()
{
    
    NSError *error;
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dataPath = [documentDirectory stringByAppendingPathComponent:@"Images"];
    [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&error];
    return dataPath;
}
#pragma mark - Getting Cache Directory Path
static inline NSString * getCacheDirectory()
{
    NSError *error;

    NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    
    NSString *dataPath = [cacheDirectory stringByAppendingPathComponent:@"CacheImages"];
    
    [[NSFileManager defaultManager]createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&error];
    return dataPath;
}