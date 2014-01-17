//
//  PremisesDevelopment.h
//  House_Map_Message
//
//  Created by 1007 on 14-1-2.
//  Copyright (c) 2014年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PremisesDevelopment : NSObject

@property (nonatomic, strong) NSString *dongtai_category;
@property (nonatomic, strong) NSString *dongtai_created;
@property (nonatomic, strong) NSString *dongtai_title;
@property (nonatomic, strong) NSString *dongtai_url;

- (id)initWithPremisesDevelopment:(NSDictionary *)dic;

@end
