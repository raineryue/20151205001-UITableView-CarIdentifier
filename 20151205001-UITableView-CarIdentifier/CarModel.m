//
//  CarModel.m
//  20151205001-UITableView-CarIdentifier
//
//  Created by Rainer on 15/12/5.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel

/**
 *  初始化一个汽车实体类（对象方法）
 */
- (instancetype)initCarWithDictionary:(NSDictionary *)dictionary {
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

/**
 *  初始化一个汽车实体类（类方法）
 */
+ (instancetype)carWithDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initCarWithDictionary:dictionary];
}

/**
 *  根据数组信息创建一个汽车数组
 */
+ (NSArray *)carsWithArray:(NSArray *)array {
    NSMutableArray *carArray = [NSMutableArray array];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [carArray addObject:[self carWithDictionary:obj]];
    }];
    
    return carArray;
}

/**
 *  复写该方法用来输出该对象的属性
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p> {icon = %@, name = %@}", self.class, self, self.icon, self.name];
}

@end
