//
//  CustomCell.h
//  IbokanProjects
//
//  Created by 1007 on 13-11-12.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (nonatomic,retain) UIImageView *imageV;
@property (nonatomic,retain) UILabel *alias;
@property (nonatomic, strong) UILabel *area;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *description;

@end
