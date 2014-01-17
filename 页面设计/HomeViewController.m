//
//  HomeViewController.m
//  House_Map_Message
//
//  Created by 1007 on 13-12-27.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "HomeViewController.h"
#import "InfoTableCell.h"
#import "PremisesInfo.h"
#import "PremisesDetailViewController.h"

#import "UIImageView+WebCache.h"

#import "NSString+URLWithArguments.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _premisesMArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    self.navigationItem.title = @"精品楼盘";
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(leftBarAction)];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(rightBarAction)];
    self.navigationItem.rightBarButtonItem = rightBar;

    self.revealSideViewController.panInteractionsWhenClosed = PPRevealSideInteractionNavigationBar|PPRevealSideInteractionNone;
    
    _mySideTableVC = [[SideTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self initWithTableView];
    
    [self.revealSideViewController preloadViewController:self.mySideTableVC forSide:PPRevealSideDirectionTop];
    [self.revealSideViewController preloadViewController:self.mySideTableVC forSide:PPRevealSideDirectionLeft];

    
    NSDictionary *arguments = [[NSDictionary alloc] initWithObjectsAndKeys:@"12",@"city_id", @"20",@"page_size", nil];
    NSURL *url = [NSString initURLWithString:NEW_PREMISES andArguments:arguments];
    
    [self getPremisesData:url];

}

- (void)getPremisesData:(NSURL *)url
{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError *error = [request error];
    if (!error) {
        NSData *data = [request responseData];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSDictionary *detailInfo = [dic objectForKey:@"result"];
        NSArray *array = [detailInfo objectForKey:@"rows"];
        
//        NSLog(@"%@", array);
        
        for (NSDictionary *dicTemp in array) {
            PremisesInfo *premisesInfo = [[PremisesInfo alloc] initWithPremisesInfo:dicTemp];
            [_premisesMArray addObject:premisesInfo];
            
            //NSLog(@"%@", premisesInfo.cityInfo);
            
            [premisesInfo release];
        }
    }
    else
    {
        NSLog(@"ASIHTTPRequest 错误");
    }
    
    //初始化主页的tablev
    _myTabeleView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _myTabeleView.delegate = self;
    _myTabeleView.dataSource = self;
    [self.view addSubview:_myTabeleView];
    
}


- (void)initWithTableView
{
//    HomeViewController *homeVC = [[HomeViewController alloc] init];
//    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    NewHouseViewController *newHouseVC = [[NewHouseViewController alloc] init];
    UINavigationController *newHouseNav = [[UINavigationController alloc] initWithRootViewController:newHouseVC];
    
    MyInfoViewController *myInfoVC = [[MyInfoViewController alloc] init];
    UINavigationController *myInfoNav = [[UINavigationController alloc] initWithRootViewController:myInfoVC];
    
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:messageVC];
    
    GroupPerchaseViewController *groupPerchaseVC = [[GroupPerchaseViewController alloc] init];
    UINavigationController *groupPrechaseNav = [[UINavigationController alloc] initWithRootViewController:groupPerchaseVC];
    
//    MapViewController *mapVC = [[MapViewController alloc] init];
//    UINavigationController *mapNav = [[UINavigationController alloc] initWithRootViewController:mapVC];
    
    NSArray *array = [NSArray arrayWithObjects:@"新盘",@"新房",@"团购",@"资讯",@"我", nil];
    
    //    tabelVC.titles = [[NSMutableArray alloc] initWithObjects:@"新盘",@"新房",@"团购",@"资讯",@"我", nil];
    
    _mySideTableVC.titles = [NSMutableArray arrayWithArray:array];
    _mySideTableVC.viewControllers = [NSMutableArray arrayWithObjects:self.navigationController, newHouseNav, myInfoNav, messageNav, groupPrechaseNav, nil];
    //_mySideTableVC.tableView.frame = CGRectMake(0, 20, 320, 548);
    
//    [homeVC release];
//    [homeNav release];
    [newHouseVC release];
    [newHouseNav release];
    [myInfoVC release];
    [myInfoNav release];
    [messageVC release];
    [messageNav release];
    [groupPerchaseVC release];
    [groupPrechaseNav release];
//    [mapVC release];
//    [mapNav release];
}



- (void)leftBarAction
{
    [self.revealSideViewController pushViewController:_mySideTableVC onDirection:PPRevealSideDirectionLeft withOffset:105.0f animated:YES];
    //[sideTable release];
    //[titles release];
}

- (void)rightBarAction
{
    [self.revealSideViewController pushViewController:_mySideTableVC onDirection:PPRevealSideDirectionTop withOffset:50.0f animated:YES];
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
    return _premisesMArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    InfoTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    if (cell == nil)
    {
        cell = [[[InfoTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    PremisesInfo *premisesInfo = [_premisesMArray objectAtIndex:indexPath.row];
    cell.premisesCity.text = premisesInfo.city_id;
    cell.premisesAddress.text = premisesInfo.address;
    cell.premisesName.text = premisesInfo.loupan_name;
    cell.premisesPrice.text = [premisesInfo.price stringByAppendingString:@"元/平"];
    cell.premisesType.text = premisesInfo.fitment_type;
    [cell.premisesImage setImageWithURL:[NSURL URLWithString:premisesInfo.default_image]];

    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
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
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    PremisesDetailViewController *detailViewController = [[PremisesDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    PremisesInfo *onePremisesInfo = [self.premisesMArray objectAtIndex:indexPath.row];
    [detailViewController getDetailPresInfo:onePremisesInfo.loupan_id];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    [detailViewController release];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
