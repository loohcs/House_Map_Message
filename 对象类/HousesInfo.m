//
//  HousesInfo.m
//  House_Test_SlideBar
//
//  Created by 1007 on 13-12-26.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "HousesInfo.h"

@implementation HousesInfo

- (id)initWithHousesInfo:(NSDictionary *)dic
{
    if (self = [super init])
    {
        _build_type = [dic objectForKey:@"buile_type"];
        _chanquan = [dic objectForKey:@"chanquan"];
        _company = [dic objectForKey:@"company"];
        _developer_name = [dic objectForKey:@"developer_name"];
        _fitment_type = [dic objectForKey:@"fitment_type"];
        _gaishu = [dic objectForKey:@"gaishu"];
        _investor = [dic objectForKey:@"investor"];
        _jianzhu_area = [dic objectForKey:@"jianzhu_area"];
        _jiaofang_date = [dic objectForKey:@"jiaofang_date"];
        _kaipan_date = [dic objectForKey:@"kaipan_date"];
        _loupan_id = [dic objectForKey:@"loupan_id"];
        _loupan_name = [dic objectForKey:@"loupan_name"];
        _lvhua = [dic objectForKey:@"lvhua"];
        _park = [dic objectForKey:@"park"];
        _park_rate = [dic objectForKey:@"park_rate"];
        _phone_400_ext = [dic objectForKey:@"phone_400_ext"];
        _phone_400_main = [dic objectForKey:@"phone_400_main"];
        _price_max = [dic objectForKey:@"price_max"];
        _price_min = [dic objectForKey:@"price_min"];
        _property_type = [dic objectForKey:@"property_type"];
        _rongji = [dic objectForKey:@"rongji"];
        _yonghu = [dic objectForKey:@"yonghu"];
        _zhandi_area = [dic objectForKey:@"zhandi_area"];
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
    
    [_build_type release];
    [_chanquan release];
    [_company release];
    [_developer_name release];
    [_fitment_type release];
    [_gaishu release];
    [_investor release];
    [_jianzhu_area release];
    [_jiaofang_date release];
    [_kaipan_date release];
    [_loupan_id release];
    [_loupan_name release];
    [_lvhua release];
    [_park release];
    [_park_rate release];
    [_phone_400_ext release];
    [_phone_400_main release];
    [_price_max release];
    [_price_min release];
    [_property_type release];
    [_rongji release];
    [_yonghu release];
    [_zhandi_area release];
}

@end
