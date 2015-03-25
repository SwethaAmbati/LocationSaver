//
//  DetailViewController.h
//  iOSAPP_FavouriteLocations
//
//  Created by Swetha Ambati on 11/10/2014.
//  Copyright (c) 2014 Swetha Ambati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *addressGeo;
@property (weak, nonatomic) IBOutlet UITextField *cityGeo;
@property (weak, nonatomic) IBOutlet UITextField *stateGeo;
@property (weak, nonatomic) IBOutlet UITextField *zipGeo;
@property (weak, nonatomic) IBOutlet UITextField *txtDetails;
@property (nonatomic,strong) NSString *strD;
@property (nonatomic,strong) NSString *strA;
@property (nonatomic,strong) NSString *strC;
@property (nonatomic,strong) NSString *strS;
@property (nonatomic,strong) NSString *strZ;
@property  CLLocationCoordinate2D coords;


-(IBAction)showMap:(id)sender;
@end
