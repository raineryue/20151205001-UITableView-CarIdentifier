//
//  CarGroupModel.m
//  20151205001-UITableView-CarIdentifier
//
//  Created by Rainer on 15/12/5.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "CarGroupModel.h"
#import "CarModel.h"

@implementation CarGroupModel

/**
 *  初始化汽车组实体对象（对象方法）
 */
- (instancetype)initCarGroupWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.title = dictionary[@"title"];
        self.cars = [CarModel carsWithArray:dictionary[@"cars"]];
//        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

/**
 *  初始化汽车组实体对象（类方法）
 */
+ (instancetype)carGroupWithDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initCarGroupWithDictionary:dictionary];
}

/**
 *  返回所有汽车品牌列表集合
 */
+ (NSArray *)carGroupArray {
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars_total" ofType:@"plist"]];
    
    NSMutableArray *carGroupArray = [NSMutableArray array];
    
    [plistArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [carGroupArray addObject:[self carGroupWithDictionary:obj]];
    }];
    
    return carGroupArray;
}

/**
 *  复写该方法打印出该对象中的所有元素
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p> {title:%@, cars:%@}", self.class, self, self.title, self.cars];
}

@end
