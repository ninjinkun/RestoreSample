//
//  CoreDataManager.h
//  BlogFeedback
//
//  Created by Asano Satoshi on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataManager : NSObject
@property (nonatomic,retain, readonly) NSPersistentStoreCoordinator* persistentStoreCoordinator;
@property (nonatomic,retain, readonly) NSManagedObjectModel* managedObjectModel;
@property (nonatomic,retain, readonly) NSManagedObjectContext* managedObjectContext;
+(CoreDataManager *)sharedManager;
-(BOOL)isRequiredMigration;
-(void)saveContext;
-(NSManagedObjectContext *)newManagedObjectContext;
@end
