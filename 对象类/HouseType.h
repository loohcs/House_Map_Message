//
//  HouseType.h
//  House_Map_Message
//
//  Created by 1007 on 14-1-2.
//  Copyright (c) 2014年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HouseType : NSObject

@property (nonatomic, strong) NSString *house_type_calias;
@property (nonatomic, strong) NSString *house_type_carea;
@property (nonatomic, strong) NSString *house_type_default_image;
@property (nonatomic, strong) NSString *house_type_decription;
@property (nonatomic, strong) NSString *house_type_id;
@property (nonatomic, strong) NSString *house_type_name;
@property (nonatomic, strong) NSString *house_type_orient;
@property (nonatomic, strong) NSString *house_type_room_alias;

- (id)initWithHouseType:(NSDictionary *)dic;

@end
