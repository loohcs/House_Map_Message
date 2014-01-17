//
//  PremisesDetailViewController.h
//  House_Map_Message
//
//  Created by 1007 on 14-1-2.
//  Copyright (c) 2014年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PremisesDetailViewController : UITableViewController<UIScrollViewDelegate>


@property (nonatomic, strong) PremisesDetailInfo *premisesDetailInfo;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageVC;

- (void)getDetailPresInfo:(NSString *)cityID;

@end
