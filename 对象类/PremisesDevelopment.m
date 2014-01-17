//
//  PremisesDevelopment.m
//  House_Map_Message
//
//  Created by 1007 on 14-1-2.
//  Copyright (c) 2014年 Ibokan. All rights reserved.
//

#import "PremisesDevelopment.h"

@implementation PremisesDevelopment

- (id)initWithPremisesDevelopment:(NSDictionary *)dic
{
    if (self = [super init])
    {
        _dongtai_category = [dic objectForKey:@"category"];
        _dongtai_created = [dic objectForKey:@"created"];
        _dongtai_title = [dic objectForKey:@"title"];
        _dongtai_url = [dic objectForKey:@"url"];
    }
    
    return self;
}

@end
