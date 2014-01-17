//
//  PremisesDetailInfo.h
//  House_Map_Message
//
//  Created by 1007 on 14-1-2.
//  Copyright (c) 2014年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PremisesDetailInfo : NSObject

@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *baidu_lat;
@property (nonatomic, strong) NSString *baidu_lng;
@property (nonatomic, strong) NSString *build_type;

@property (nonatomic, strong) NSString *chanquan;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSArray *daogou;

@property (nonatomic, strong) NSString *default_image;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) NSString *developer;

@property (nonatomic, strong) NSArray *dongtai;
@property (nonatomic, strong) NSMutableArray *developmentArray;

@property (nonatomic, strong) NSString *fitment_type;
@property (nonatomic, strong) NSString *has_sale;
@property (nonatomic, strong) NSString *gaishu;

@property (nonatomic, strong) NSString *house_type_count;
@property (nonatomic, strong) NSArray *house_types;
@property (nonatomic, strong) NSMutableArray *houseTypeArray;

@property (nonatomic, strong) NSString *housetype_first_id;
@property (nonatomic, strong) NSString *image_total;

@property (nonatomic, strong) NSArray *images;

@property (nonatomic, strong) NSString *investor;
@property (nonatomic, strong) NSString *is_sales_market;
@property (nonatomic, strong) NSString *is_sales_promotion;
@property (nonatomic, strong) NSString *jianzhu_area;
@property (nonatomic, strong) NSString *jiaofang_new_date;
@property (nonatomic, strong) NSString *jiaofang_date;
@property (nonatomic, strong) NSString *kaipan_date;
@property (nonatomic, strong) NSString *kaipan_new_date;
@property (nonatomic, strong) NSString *kft;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lng;
@property (nonatomic, strong) NSDictionary *location_info;
@property (nonatomic, strong) NSString *loop_line;
@property (nonatomic, strong) NSString *loupan_id;
@property (nonatomic, strong) NSString *loupan_name;
@property (nonatomic, strong) NSArray *louping;
@property (nonatomic, strong) NSString *metro_info;
@property (nonatomic, strong) NSString *lvhua;
@property (nonatomic, strong) NSString *park;
@property (nonatomic, strong) NSString *phone_400_ext;
@property (nonatomic, strong) NSString *phone_400_main;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *prop_num;
@property (nonatomic, strong) NSString *property_fee;
@property (nonatomic, strong) NSString *property_type;
@property (nonatomic, strong) NSString *proxy_address;
@property (nonatomic, strong) NSString *quedian;
@property (nonatomic, strong) NSString *region_id;
@property (nonatomic, strong) NSString *region_pinyin;
@property (nonatomic, strong) NSString *region_title;
@property (nonatomic, strong) NSString *rongji;
@property (nonatomic, strong) NSString *sale_tag;
@property (nonatomic, strong) NSString *status_sale;
@property (nonatomic, strong) NSString *sub_region_id;
@property (nonatomic, strong) NSString *sub_region_title;
@property (nonatomic, strong) NSString *touch_loupan_view;
@property (nonatomic, strong) NSDictionary *tuangou;
@property (nonatomic, strong) NSString *yonghu;
@property (nonatomic, strong) NSString *youdian;
@property (nonatomic, strong) NSString *zhandi_area;

- (id)initWithPremisesDetail:(NSDictionary *)dic;

@end
