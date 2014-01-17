//
//  InfoTableCell.h
//  House_Map_Message
//
//  Created by 1007 on 13-12-31.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoTableCell : UITableViewCell

@property (nonatomic, strong) UIImageView *premisesImage;
@property (nonatomic, strong) UILabel *premisesName;
@property (nonatomic, strong) UILabel *premisesCity;
@property (nonatomic, strong) UILabel *premisesAddress;
@property (nonatomic, strong) UILabel *premisesType;
@property (nonatomic, strong) UILabel *premisesPrice;

@end
