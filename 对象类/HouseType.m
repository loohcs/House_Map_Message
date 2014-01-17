//
//  HouseType.m
//  House_Map_Message
//
//  Created by 1007 on 14-1-2.
//  Copyright (c) 2014年 Ibokan. All rights reserved.
//

#import "HouseType.h"

@implementation HouseType

- (id)initWithHouseType:(NSDictionary *)dic
{
    if (self = [super init]) {
        _house_type_calias = [dic objectForKey:@"house_type_calias"];
        _house_type_carea = [dic objectForKey:@"carea"];
        _house_type_default_image = [dic objectForKey:@"default_image"];
        _house_type_decription = [dic objectForKey:@"decription"];
        _house_type_id = [dic objectForKey:@"id"];
        _house_type_name = [dic objectForKey:@"name"];
        _house_type_orient = [dic objectForKey:@"orient"];
        _house_type_room_alias = [dic objectForKey:@"room_alias"];
    }
    
    return self;
}

@end
