//
//  ListTableViewController.m
//  iOSAPP_FavouriteLocations
//
//  Created by Swetha Ambati on 11/10/2014.
//  Copyright (c) 2014 Swetha Ambati. All rights reserved.
//
#import "ListTableViewController.h"
#import "DetailViewController.h"
@interface ListTableViewController ()

@property(nonatomic,strong) ViewController *addController;

@end

@implementation ListTableViewController
@synthesize items,addController;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Favourite Locations";
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addArticle)];
    NSDictionary *dictIosArticle1 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Safeway", @"Safeway Address",@"3970 Rivermark Plaza",@"Santa Clara",@"CA",@"95054",nil] forKeys:[NSArray arrayWithObjects:@"TitleTxt",@"Desc",@"Address",@"City",@"State",@"Zip", nil]];
    NSDictionary *dictIosArticle2 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"Oracle", @"Office Address",@"100 Oracke Pkwy",@"Redwood City",@"CA",@"94065",nil] forKeys:[NSArray arrayWithObjects:@"TitleTxt",@"Desc",@"Address",@"City",@"State",@"Zip", nil]];
    
    items = [[NSMutableArray alloc] initWithObjects:dictIosArticle1,dictIosArticle2, nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) addArticle
{
    addController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    addController.delegate = self;

    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:addController];

    [self presentViewController:navController animated:YES completion:nil];
}

-(void) addTitle:(NSString *)strTitle addDescription:(NSString *) strDesc addAddress:(NSString *)strAddress addCity:(NSString *)strCity addState:(NSString *)strState addZip:(NSString *)strZip
{
    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc] init];
    [mutDict setObject:strTitle forKey:@"TitleTxt"];
    [mutDict setObject:strDesc forKey:@"Desc"];
     [mutDict setObject:strAddress forKey:@"Address"];
     [mutDict setObject:strCity forKey:@"City"];
     [mutDict setObject:strState forKey:@"State"];
     [mutDict setObject:strZip forKey:@"Zip"];
    
    [items addObject:mutDict];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    NSDictionary *dictTmp = [items objectAtIndex:indexPath.row];
    cell.textLabel.text = [dictTmp objectForKey:@"TitleTxt"];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:12.0];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0f;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
    NSDictionary *dictTemp = [items objectAtIndex:indexPath.row];
    detailViewController.strD = [dictTemp objectForKey:@"Desc"];
    detailViewController.strA = [dictTemp objectForKey:@"Address"];
    detailViewController.strC = [dictTemp objectForKey:@"City"];
    detailViewController.strS = [dictTemp objectForKey:@"State"];
    detailViewController.strZ = [dictTemp objectForKey:@"Zip"];
    [self.navigationController pushViewController:detailViewController animated:YES];
}
@end
