//
//  PremisesInfo.m
//  House_Map_Message
//
//  Created by 1007 on 13-12-30.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "PremisesInfo.h"
#import "PremisesDevelopment.h"
#import "HouseType.h"
#import "NSString+URLWithArguments.h"
@implementation PremisesInfo

- (id)initWithPremisesInfo:(NSDictionary *)dic
{
    if (self = [super init])
    {
        self.address = [dic objectForKey:@"address"];
        self.baidu_lat = [dic objectForKey:@"baidu_lat"];
        self.baidu_lng = [dic objectForKey:@"baidu_lng"];
        self.build_type = [dic objectForKey:@"build_type"];
        
        self.city_id = [dic objectForKey:@"city_id"];
        self.cityInfo = [NSString getCityName:self.city_id];
        
        self.default_image = [dic objectForKey:@"default_image"];
        self.image = [[UIImage alloc] init];
        self.developer = [dic objectForKey:@"developer"];
        
        self.dongtai = [dic objectForKey:@"dongtai"];
        self.developmentArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dicTemp in _dongtai) {
            PremisesDevelopment *preDevelopment = [[PremisesDevelopment alloc] initWithPremisesDevelopment:dicTemp];
            [self.developmentArray addObject:preDevelopment];
            
            [preDevelopment release];
        }
        
        
        self.fitment_type = [dic objectForKey:@"fitment_type"];
        _has_sale = [dic objectForKey:@"has_sale"];
        
        self.house_type_count = [dic objectForKey:@"house_type_count"];
        self.house_types = [dic objectForKey:@"house_types"];
        self.houseTypeArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dicTemp in self.house_types) {
            HouseType *houseType = [[HouseType alloc] initWithHouseType:dicTemp];
            [self.houseTypeArray addObject:houseType];
            
            [houseType release];
        }
        
        _is_sales_market = [dic objectForKey:@"is_sales_market"];
        _is_sales_promotion = [dic objectForKey:@"is_sales_promotion"];
        self.kaipan_date = [dic objectForKey:@"kaipan_date"];
        self.kaipan_new_date = [dic objectForKey:@"kaipan_new_date"];
        _kft = [dic objectForKey:@"kft"];
        _lat = [dic objectForKey:@"lat"];
        _lng = [dic objectForKey:@"lng"];
        _loop_line = [dic objectForKey:@"loop_line"];
        self.loupan_id = [dic objectForKey:@"loupan_id"];
        self.loupan_name = [dic objectForKey:@"loupan_name"];
        _metro_info = [dic objectForKey:@"metro_info"];
        _phone_400_ext = [dic objectForKey:@"phone_400_ext"];
        _phone_400_main = [dic objectForKey:@"phone_400_main"];
        
        self.price = [NSString stringWithFormat:@"%@", [dic objectForKey:@"price"]];
        self.price_range = [dic objectForKey:@"price_range"];
        self.price_range_city_id = [self.price_range objectForKey:@"city_id"];
        self.price_range_flag = [self.price_range objectForKey:@"flag"];
        self.price_range_id = [self.price_range objectForKey:@"id"];
        self.price_range_lowerlimit = [self.price_range objectForKey:@"lowerlimit"];
        self.price_range_rank = [self.price_range objectForKey:@"rank"];
        self.price_range_title = [self.price_range objectForKey:@"title"];
        self.price_range_uperlimit = [self.price_range objectForKey:@"uperlimit"];
        
        _prop_num = [dic objectForKey:@"prop_num"];
        _region_id = [dic objectForKey:@"region_id"];
        _region_title = [dic objectForKey:@"region_title"];
        _tese = [dic objectForKey:@"tese"];
        self.tuangou = [dic objectForKey:@"tuangou"];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    
    [_address release];
    [_baidu_lat release];
    [_baidu_lng release];
    [_build_type release];
    [_city_id release];
    [_default_image release];
    [_image release];
    [_developer release];
    
    [_dongtai release];
    [_developmentArray release];
    
    [_fitment_type release];
    [_has_sale release];
    
    [_house_type_count release];
    [_house_types release];
    [_houseTypeArray release];

    
    [_is_sales_market release];
    [_is_sales_promotion release];
    [_kaipan_date release];
    [_kaipan_new_date release];
    [_kft release];
    [_lat release];
    [_lng release];
    [_loop_line release];
    [_loupan_id release];
    [_loupan_name release];
    [_metro_info release];
    [_phone_400_ext release];
    [_phone_400_main release];
    
    [_price release];
    [_price_range release];
    [_price_range_city_id release];
    [_price_range_flag release];
    [_price_range_id release];
    [_price_range_lowerlimit release];
    [_price_range_rank release];
    [_price_range_title release];
    [_price_range_uperlimit release];
    
    [_prop_num release];
    [_region_id release];
    [_region_title release];
    [_tese release];
    [_tuangou release];
}



@end
