//
//  HomeViewController.h
//  House_Map_Message
//
//  Created by 1007 on 13-12-27.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPRevealSideViewController.h"
#import "BMapKit.h"
#import "SideTableViewController.h"
#import "ASIHTTPRequest.h"
#import "SDWebImageManager.h"

@interface HomeViewController : UIViewController<ASIHTTPRequestDelegate, UITableViewDelegate, UITableViewDataSource>

//@property (nonatomic, strong) PPRevealSideViewController *revealSideViewController;
@property (nonatomic, strong) SideTableViewController *mySideTableVC;
@property (nonatomic, strong) UITableView *myTabeleView;
@property (nonatomic, strong) NSMutableArray *premisesMArray;


@end
