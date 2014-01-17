//
//  InfoTableCell.m
//  House_Map_Message
//
//  Created by 1007 on 13-12-31.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "InfoTableCell.h"

@implementation InfoTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _premisesImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 60/0.618, 60)];
//        _premisesImage.backgroundColor = [UIColor cyanColor];
        
        _premisesName = [[UILabel alloc] initWithFrame:CGRectMake(60/0.618 + 10, 5, 200, 20)];
        _premisesName.font = [UIFont systemFontOfSize:15];
//        _premisesName.backgroundColor = [UIColor redColor];
        
        _premisesCity = [[UILabel alloc] initWithFrame:CGRectMake(60/0.618 + 10, 30, 50, 15)];
        _premisesCity.font = [UIFont systemFontOfSize:12];
//        _premisesCity.backgroundColor = [UIColor blueColor];
        
        _premisesAddress = [[UILabel alloc] initWithFrame:CGRectMake(60/0.618 + 60, 30, 150, 15)];
        _premisesAddress.font = [UIFont systemFontOfSize:12];
//        _premisesAddress.backgroundColor = [UIColor greenColor];
        
        
        _premisesType = [[UILabel alloc] initWithFrame:CGRectMake(60/0.618 + 10, 50, 80, 15)];
        _premisesType.font = [UIFont systemFontOfSize:12];
//        _premisesType.backgroundColor = [UIColor purpleColor];
        
        _premisesPrice = [[UILabel alloc] initWithFrame:CGRectMake(200, 50, 100, 15)];
        _premisesPrice.font = [UIFont systemFontOfSize:12];
//        _premisesPrice.backgroundColor = [UIColor grayColor];
        
//        self.backgroundColor = [UIColor cyanColor];
        
        [self addSubview:_premisesType];
        [self addSubview:_premisesPrice];
        [self addSubview:_premisesName];
        [self addSubview:_premisesImage];
        [self addSubview:_premisesCity];
        [self addSubview:_premisesAddress];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    
    [_premisesImage release];
    [_premisesCity release];
    [_premisesAddress release];
    [_premisesName release];
    [_premisesPrice release];
    [_premisesType release];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
