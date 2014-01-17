//
//  PremisesDetailInfo.m
//  House_Map_Message
//
//  Created by 1007 on 14-1-2.
//  Copyright (c) 2014年 Ibokan. All rights reserved.
//

#import "PremisesDetailInfo.h"

@implementation PremisesDetailInfo

- (id)initWithPremisesDetail:(NSDictionary *)dic
{
    if (self = [super init])
    {
        self.address = [dic objectForKey:@"address"];
        self.baidu_lat = [dic objectForKey:@"baidu_lat"];
        self.baidu_lng = [dic objectForKey:@"baidu_lng"];
        self.build_type = [dic objectForKey:@"build_type"];
        self.chanquan = [dic objectForKey:@"chanquan"];
        self.company = [dic objectForKey:@"company"];
        self.daogou = [dic objectForKey:@"dougou"];
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
        self.gaishu = [dic objectForKey:@"gaishu"];
        self.has_sale = [dic objectForKey:@"has_sale"];
        self.house_type_count = [dic objectForKey:@"house_type_count"];
        self.house_types = [dic objectForKey:@"house_types"];
        self.houseTypeArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dicTemp in self.house_types) {
            HouseType *houseType = [[HouseType alloc] initWithHouseType:dicTemp];
            [self.houseTypeArray addObject:houseType];
            
            [houseType release];
        }
        self.housetype_first_id = [dic objectForKey:@"housetype_first_id"];
        
        self.image_total = [dic objectForKey:@"image_total"];
        self.images = [dic objectForKey:@"images"];
        
        self.investor = [dic objectForKey:@"investor"];
        self.is_sales_market = [dic objectForKey:@"is_sales_market"];
        self.is_sales_promotion = [dic objectForKey:@"is_sales_promotion"];
        self.jianzhu_area = [dic objectForKey:@"jianzhu_area"];
        self.jiaofang_date = [dic objectForKey:@"jiaofang_date"];
        self.jiaofang_new_date = [dic objectForKey:@"jiaofang_new_date"];
        self.kaipan_date = [dic objectForKey:@"kaipan_date"];
        self.kaipan_new_date = [dic objectForKey:@"kaipan_new_date"];
        self.kft = [dic objectForKey:@"kft"];
        self.lat = [dic objectForKey:@"lat"];
        self.lng = [dic objectForKey:@"lng"];
        
        self.location_info = [dic objectForKey:@"location_info"];
        
        self.lvhua = [dic objectForKey:@"lvhua"];
        self.park = [dic objectForKey:@"park"];
        self.loop_line = [dic objectForKey:@"loop_line"];
        self.loupan_id = [dic objectForKey:@"loupan_id"];
        self.loupan_name = [dic objectForKey:@"loupan_name"];
        self.metro_info = [dic objectForKey:@"metro_info"];
        self.phone_400_ext = [dic objectForKey:@"phone_400_ext"];
        self.phone_400_main = [dic objectForKey:@"phone_400_main"];
        self.price = [NSString stringWithFormat:@"%@", [dic objectForKey:@"price"]];
        self.prop_num = [dic objectForKey:@"prop_num"];
        self.property_fee = [dic objectForKey:@"property_fee"];
        self.property_type = [dic objectForKey:@"property_type"];
        self.proxy_address = [dic objectForKey:@"proxy_address"];
        self.quedian = [dic objectForKey:@"quedian"];
        self.region_id = [dic objectForKey:@"region_id"];
        self.region_pinyin = [dic objectForKey:@"region_pinyin"];
        self.region_title = [dic objectForKey:@"region_title"];
        self.rongji = [dic objectForKey:@"rongji"];
        self.sale_tag = [dic objectForKey:@"sale_tag"];
        self.status_sale = [dic objectForKey:@"status_sale"];
        self.sub_region_id = [dic objectForKey:@"sub_region_id"];
        self.sub_region_title = [dic objectForKey:@"sub_region_title"];
        self.touch_loupan_view = [dic objectForKey:@"touch_loupan_view"];
        self.tuangou = [dic objectForKey:@"tuangou"];
        self.yonghu = [dic objectForKey:@"yonghu"];
        self.youdian = [dic objectForKey:@"youdian"];
        self.zhandi_area = [dic objectForKey:@"zhandi_area"];
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
    [_chanquan release];
    [_company release];
    [_daogou release];
    [_default_image release];
    [_image release];
    [_developer release];
    
    [_dongtai release];
    [_developmentArray release];
    
    [_fitment_type release];
    [_has_sale release];
    [_gaishu release];
    
    [_house_type_count release];
    [_house_types release];
    [_houseTypeArray release];
    
    [_housetype_first_id release];
    
    [_image_total release];
    [_images release];
    
    [_investor release];
    [_is_sales_market release];
    [_is_sales_promotion release];
    [_jianzhu_area release];
    [_jiaofang_date release];
    [_jiaofang_new_date release];
    [_kaipan_date release];
    [_kaipan_new_date release];
    [_kft release];
    [_lat release];
    [_lng release];
    
    [_location_info release];
    
    [_loop_line release];
    [_loupan_id release];
    [_loupan_name release];
    [_louping release];
    [_lvhua release];
    [_park release];
    [_metro_info release];
    [_phone_400_ext release];
    [_phone_400_main release];
    
    [_price release];

    [_prop_num release];
    [_property_fee release];
    [_property_type release];
    [_proxy_address release];
    [_quedian release];
    [_region_id release];
    [_region_pinyin release];
    [_region_title release];
    [_rongji release];
    [_sale_tag release];
    [_status_sale release];
    [_sub_region_id release];
    [_sub_region_title release];
    [_touch_loupan_view release];
    [_tuangou release];
    [_yonghu release];
    [_youdian release];
    [_zhandi_area release];
    
}



@end
