//
//  PremisesInfo.h
//  House_Map_Message
//
//  Created by 1007 on 13-12-30.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PremisesInfo : NSObject

@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *baidu_lat;
@property (nonatomic, strong) NSString *baidu_lng;
@property (nonatomic, strong) NSString *build_type;

@property (nonatomic, strong) NSString *city_id;
@property (nonatomic, strong) NSDictionary *cityInfo;

@property (nonatomic, strong) NSString *default_image;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) NSString *developer;

@property (nonatomic, strong) NSArray *dongtai;
@property (nonatomic, strong) NSMutableArray *developmentArray;

@property (nonatomic, strong) NSString *fitment_type;
@property (nonatomic, strong) NSString *has_sale;

@property (nonatomic, strong) NSString *house_type_count;
@property (nonatomic, strong) NSArray *house_types;
@property (nonatomic, strong) NSMutableArray *houseTypeArray;

@property (nonatomic, strong) NSString *is_sales_market;
@property (nonatomic, strong) NSString *is_sales_promotion;
@property (nonatomic, strong) NSString *kaipan_date;
@property (nonatomic, strong) NSString *kaipan_new_date;
@property (nonatomic, strong) NSString *kft;

@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lng;
@property (nonatomic, strong) NSString *loop_line;
@property (nonatomic, strong) NSString *loupan_id;
@property (nonatomic, strong) NSString *loupan_name;
@property (nonatomic, strong) NSString *metro_info;
@property (nonatomic, strong) NSString *phone_400_ext;
@property (nonatomic, strong) NSString *phone_400_main;

@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSDictionary *price_range;
@property (nonatomic, strong) NSString *price_range_city_id;
@property (nonatomic, strong) NSString *price_range_flag;
@property (nonatomic, strong) NSString *price_range_id;
@property (nonatomic, strong) NSString *price_range_lowerlimit;
@property (nonatomic, strong) NSString *price_range_rank;
@property (nonatomic, strong) NSString *price_range_title;
@property (nonatomic, strong) NSString *price_range_uperlimit;

@property (nonatomic, strong) NSString *prop_num;
@property (nonatomic, strong) NSString *region_id;
@property (nonatomic, strong) NSString *region_title;
@property (nonatomic, strong) NSString *sale_tag;
@property (nonatomic, strong) NSString *spinyin;
@property (nonatomic, strong) NSString *status_sale;
@property (nonatomic, strong) NSString *sub_region_id;
@property (nonatomic, strong) NSString *sub_region_title;
@property (nonatomic, strong) NSString *tese;
@property (nonatomic, strong) NSDictionary *tuangou;


- (id)initWithPremisesInfo:(NSDictionary *)dic;

@end
