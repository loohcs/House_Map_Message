//
//  CustomCell.m
//  IbokanProjects
//
//  Created by 1007 on 13-11-12.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)Cell reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:Cell reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 70, 70)];
        [self addSubview:_imageV];
        //设置附属按钮的类型
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        _name = [[UILabel alloc] initWithFrame:CGRectMake(80, 5, 200, 20)];
        _name.font = [UIFont systemFontOfSize:15];
        [self addSubview:_name];
        
        _alias = [[UILabel alloc] initWithFrame:CGRectMake(80, 30, 60, 15)];
        _alias.font = [UIFont systemFontOfSize:12];
        [self addSubview:_alias];
        
        _area = [[UILabel alloc] initWithFrame:CGRectMake(150, 30, 100, 15)];
        _area.font = [UIFont systemFontOfSize:12];
        [self addSubview:_area];
        
        _description = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, 200, 30)];
        _description.font = [UIFont systemFontOfSize:12];
        [self addSubview:_description];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
