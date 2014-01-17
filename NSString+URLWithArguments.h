//
//  NSString+URLWithArguments.h
//  House_Map_Message
//
//  Created by 1007 on 14-1-2.
//  Copyright (c) 2014年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLWithArguments)

+ (NSURL *)initURLWithString:(NSString *)str andArguments:(NSDictionary *)dic;

+ (NSDictionary *)getCityName:(NSString *)cityID;

@end
