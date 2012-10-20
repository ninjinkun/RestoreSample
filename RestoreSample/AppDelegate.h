//
//  AppDelegate.h
//  RestoreSample
//
//  Created by 浅野 慧 on 10/14/12.
//  Copyright (c) 2012 Satoshi Asano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)saveContext;

@end
