//
//  NSString+URLWithArguments.m
//  House_Map_Message
//
//  Created by 1007 on 14-1-2.
//  Copyright (c) 2014年 Ibokan. All rights reserved.
//

#import "NSString+URLWithArguments.h"

@implementation NSString (URLWithArguments)

+ (NSURL *)initURLWithString:(NSString *)str andArguments:(NSDictionary *)dic
{
    //将字符串以“&”为标志分开，然后存入一个数组中
    NSArray *arr = [str componentsSeparatedByString:@"&"];
    NSMutableArray *mutableArr = [NSMutableArray arrayWithArray:arr];
    
    //将传入的参数字典的关键字取出
    NSArray *keys = [dic allKeys];
    
    for (NSString *key in keys) {
        for (int i = 0; i<mutableArr.count; i++) {
            NSString *strTemp = [mutableArr objectAtIndex:i];
            
            //判断我们找到的字符串是不是要包含参数的那个
            if ([strTemp hasPrefix:key])
            {
                //将参数的值修改之后覆盖数组中原来的参数
                NSString *argument = [key stringByAppendingFormat:@"=%@",[dic objectForKey:key]];
                [mutableArr replaceObjectAtIndex:i withObject:argument];
                break;
            }
        }
    }
    
    //重新拼接字符串加入“&”
    NSMutableString *strWithArgu = [[NSMutableString alloc] init];
    for (int i = 0; i<mutableArr.count-1;i++) {
        NSString *strTemp = [mutableArr objectAtIndex:i];
        [strWithArgu appendFormat:@"%@&", strTemp];
    }
    
    NSURL *url = [NSURL URLWithString:strWithArgu];
    
    [strWithArgu release];
    
    return url;

}

+ (NSDictionary *)getCityName:(NSString *)cityID
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    NSDictionary *cityInfoDic = [dic objectForKey:cityID];
    
    
    return cityInfoDic;
}

@end
