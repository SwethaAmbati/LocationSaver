//
//  AppDelegate.h
//  iOSAPP_FavouriteLocations
//
//  Created by Swetha Ambati on 11/10/2014.
//  Copyright (c) 2014 Swetha Ambati. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListTableViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) ListTableViewController *vController;
@end
