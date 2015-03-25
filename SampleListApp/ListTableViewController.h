//
//  ListTableViewController.h
//  iOSAPP_FavouriteLocations
//
//  Created by Swetha Ambati on 11/10/2014.
//  Copyright (c) 2014 Swetha Ambati. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ListTableViewController : UITableViewController<LocationDelegate>
@property (nonatomic,strong) NSMutableArray *items;
@end
