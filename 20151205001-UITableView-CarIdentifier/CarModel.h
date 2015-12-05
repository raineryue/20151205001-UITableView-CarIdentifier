//
//  CarModel.h
//  20151205001-UITableView-CarIdentifier
//
//  Created by Rainer on 15/12/5.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarModel : NSObject

/** 图标 */
@property (nonatomic, strong) NSString *icon;

/** 名称 */
@property (nonatomic, strong) NSString *name;

/**
 *  初始化一个汽车实体类（对象方法）
 */
- (instancetype)initCarWithDictionary:(NSDictionary *)dictionary;

/**
 *  初始化一个汽车实体类（类方法）
 */
+ (instancetype)carWithDictionary:(NSDictionary *)dictionary;

/**
 *  根据数组信息创建一个汽车数组
 */
+ (NSArray *)carsWithArray:(NSArray *)array;

@end
