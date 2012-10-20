//
//  DetailViewController.h
//  RestoreSample
//
//  Created by 浅野 慧 on 10/14/12.
//  Copyright (c) 2012 Satoshi Asano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSManagedObject *detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
