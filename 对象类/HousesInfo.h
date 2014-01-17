//
//  HousesInfo.h
//  House_Test_SlideBar
//
//  Created by 1007 on 13-12-26.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HousesInfo : NSObject

@property (nonatomic, strong) NSString *build_type;
@property (nonatomic, strong) NSString *chanquan;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *developer_name;
@property (nonatomic, strong) NSString *fitment_type;
@property (nonatomic, strong) NSString *gaishu;
@property (nonatomic, strong) NSString *investor;
@property (nonatomic, strong) NSString *jianzhu_area;
@property (nonatomic, strong) NSString *jiaofang_date;
@property (nonatomic, strong) NSString *kaipan_date;
@property (nonatomic, strong) NSString *loupan_id;
@property (nonatomic, strong) NSString *loupan_name;
@property (nonatomic, strong) NSString *lvhua;
@property (nonatomic, strong) NSString *park;
@property (nonatomic, strong) NSString *park_rate;
@property (nonatomic, strong) NSString *phone_400_ext;
@property (nonatomic, strong) NSString *phone_400_main;
@property (nonatomic, strong) NSString *price_max;
@property (nonatomic, strong) NSString *price_min;
@property (nonatomic, strong) NSString *property_type;
@property (nonatomic, strong) NSString *rongji;
@property (nonatomic, strong) NSString *yonghu;
@property (nonatomic, strong) NSString *zhandi_area;


- (id)initWithHousesInfo:(NSDictionary *)dic;

@end
