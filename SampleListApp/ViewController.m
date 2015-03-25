//
//  ViewController.m
//  iOSAPP_FavouriteLocations
//
//  Created by Swetha Ambati on 11/10/2014.
//  Copyright (c) 2014 Swetha Ambati. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize delegate;
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
    self.title = @"Enter Location";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAction)];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveAction {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if((![self.titleTxt.text isEqualToString:@""]) &&(![self.desc.text isEqualToString:@""]) &&(![self.address.text isEqualToString:@""]) &&(![self.city.text isEqualToString:@""]) &&(![self.state.text isEqualToString:@""]) &&(![self.zip.text isEqualToString:@""]))
    {
        if([self.delegate respondsToSelector:@selector(addArticleName:addArticleDesc:addAddress:addCity:addState:addZip:)])
        {
            [self.delegate addTitle:self.titleTxt.text addDescription:self.desc.text  addAddress:self.address.text addCity:self.city.text addState:self.state.text addZip:self.zip.text ];
        }
    }
}

- (void)cancelAction{
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
