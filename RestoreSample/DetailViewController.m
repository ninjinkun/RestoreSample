//
//  DetailViewController.m
//  RestoreSample
//
//  Created by 浅野 慧 on 10/14/12.
//  Copyright (c) 2012 Satoshi Asano. All rights reserved.
//

#import "DetailViewController.h"
#import "CoreDataManager.h"
#define kItemKey @"Item"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

-(void)awakeFromNib {
    [super awakeFromNib];
    if ([self respondsToSelector:@selector(restorationClass)]) {
        self.restorationClass = [self class];
    }
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Restoration 

// オブジェクトのIDを保存する
-(void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    // CoreDataのURLを保存する
    LOG(@"save state");
    [coder encodeObject:self.detailItem.objectID.URIRepresentation forKey:kItemKey];
    
    [super encodeRestorableStateWithCoder:coder];
}

// オブジェクトを復元する
-(void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    NSURL *itemObjectURL = [coder decodeObjectForKey:kItemKey];
    NSManagedObjectID *itemObjectID = [[CoreDataManager sharedManager].persistentStoreCoordinator managedObjectIDForURIRepresentation:itemObjectURL];
    
    if (itemObjectID) {
        self.detailItem = [[CoreDataManager sharedManager].managedObjectContext objectWithID:itemObjectID];
    }

    [super decodeRestorableStateWithCoder:coder];
}

@end
