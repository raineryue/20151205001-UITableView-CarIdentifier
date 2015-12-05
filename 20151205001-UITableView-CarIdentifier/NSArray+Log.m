//
//  NSArray+Log.m
//  20151205001-UITableView-CarIdentifier
//
//  Created by Rainer on 15/12/5.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

/**
 *  遍历拼接字符串输出数组元素
 */
- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *mutableString = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mutableString appendFormat:@"\t%@, \n", obj];
    }];
    
    [mutableString appendString:@")"];
    
    return mutableString;
}

@end

@implementation NSDictionary (Log)

/**
 *  遍历拼接字符串输出字典 元素
 */
- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *mutableString = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [mutableString appendFormat:@"\t%@ = %@, \n", key, obj];
    }];
    
    [mutableString appendString:@"}"];
    
    return mutableString;
}

@end
