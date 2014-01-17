//
//  LoupanInfoCell.m
//  House_Map_Message
//
//  Created by 1007 on 14-1-7.
//  Copyright (c) 2014年 Ibokan. All rights reserved.
//

#import "LoupanInfoCell.h"

@implementation LoupanInfoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.loupanNewDate = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 150, 20)];
        self.loupanNewDate.font = [UIFont systemFontOfSize:12];
        
        self.loupanFitmtype = [[UILabel alloc] initWithFrame:CGRectMake(160, 5, 150, 20)];
        self.loupanFitmtype.font = [UIFont systemFontOfSize:12];
        
        self.buildType = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 250, 20)];
        self.buildType.font = [UIFont systemFontOfSize:12];
        
        self.address = [[UILabel alloc] initWithFrame:CGRectMake(10, 55, 300, 20)];
        self.address.font = [UIFont systemFontOfSize:12];
        
        self.company = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 300, 20)];
        self.company.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:self.loupanNewDate];
        [self addSubview:self.loupanFitmtype];
        [self addSubview:self.buildType];
        [self addSubview:self.address];
        [self addSubview:self.company];
        
    }
    return self;
}

- (void)dealloc
{
    [_loupanNewDate release];
    [_loupanFitmtype release];
    [_buildType release];
    [_address release];
    [_company release];
    [super dealloc];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
