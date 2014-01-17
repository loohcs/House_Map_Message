//
//  AppDelegate.h
//  House_Map_Message
//
//  Created by 1007 on 13-12-23.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPRevealSideViewController.h"
#import "BMapKit.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) PPRevealSideViewController *revealSideVC;
@property (strong, nonatomic) BMKMapManager *mapManager;
@property (strong, nonatomic) UIWindow *window;

@end
