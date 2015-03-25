//
//  DetailViewController.m
//  iOSAPP_FavouriteLocations
//
//  Created by Swetha Ambati on 11/10/2014.
//  Copyright (c) 2014 Swetha Ambati. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize strD;
@synthesize strA;
@synthesize strZ;@synthesize strC;
@synthesize strS;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Location Details";
    self.txtDetails.text = strD;
    self.addressGeo.text= strA;
    self.cityGeo.text=strC;
    self.stateGeo.text=strS;
    self.zipGeo.text=strZ;
    
  

    
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)showMap:(id)sender;
{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    NSString *addressString = [NSString stringWithFormat:@"%@ %@ %@ %@",
                               _addressGeo.text,_cityGeo.text,_stateGeo.text,_zipGeo.text];
    [geocoder
     geocodeAddressString:addressString completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if(error){
             NSLog(@"Geocode failed with error:%@",error);
             return;
         }
         if (placemarks && placemarks.count>0)
         {
             CLPlacemark *placemark = placemarks[0];
             CLLocation *location = placemark.location;
             _coords = location.coordinate;
             [self showMap];
             
         }
         
     }];
    
}


-(void)showMap
{
    NSDictionary *address = @{
                              (NSString *)kABPersonAddressStreetKey: strA,
                              (NSString *)kABPersonAddressCityKey: strC,
                              (NSString *)kABPersonAddressStateKey: strS,
                              (NSString *)kABPersonAddressZIPKey: strZ,
                              };
    
    MKPlacemark *place = [[MKPlacemark alloc]
                          initWithCoordinate:_coords
                          addressDictionary:address];
    
    MKMapItem *mapItem = [[MKMapItem alloc]initWithPlacemark:place];
    
    NSDictionary *options = @{
                              MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving
                              };
    
    [mapItem openInMapsWithLaunchOptions:options];
}




- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.txtDetails.text = strD;
    self.addressGeo.text= strA;
    self.cityGeo.text=strC;
    self.stateGeo.text=strS;
    self.zipGeo.text=strZ;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
