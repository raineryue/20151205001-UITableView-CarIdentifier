//
//  CarGroupModel.h
//  20151205001-UITableView-CarIdentifier
//
//  Created by Rainer on 15/12/5.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarGroupModel : NSObject

/** 标题 */
@property (nonatomic, strong) NSString *title;

/** 汽车列表 */
@property (nonatomic, strong) NSArray *cars;

/** 
 *  初始化汽车组实体对象（对象方法）
 */
- (instancetype)initCarGroupWithDictionary:(NSDictionary *)dictionary;

/**
 *  初始化汽车组实体对象（类方法）
 */
+ (instancetype)carGroupWithDictionary:(NSDictionary *)dictionary;

/**
 *  返回所有汽车品牌列表集合
 */
+ (NSArray *)carGroupArray;

@end
