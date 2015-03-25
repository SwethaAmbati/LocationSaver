//
//  ViewController.h
//  iOSAPP_FavouriteLocations
//
//  Created by Swetha Ambati on 11/10/2014.
//  Copyright (c) 2014 Swetha Ambati. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol LocationDelegate <NSObject>

-(void) addTitle:(NSString *)strTitle addDescription:(NSString *) strDesc addAddress:(NSString *)strAddress addCity:(NSString *)strCity addState:(NSString *)strState addZip:(NSString *)strZip;

@end

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *titleTxt;
@property (weak, nonatomic) IBOutlet UITextField *desc;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITextField *zip;

@property (unsafe_unretained) id <LocationDelegate> delegate;
- (void)saveAction;
- (void)cancelAction;
@end
