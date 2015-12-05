//
//  ViewController.m
//  20151205001-UITableView-CarIdentifier
//
//  Created by Rainer on 15/12/5.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "CarGroupModel.h"
#import "CarModel.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray *carArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@", self.carArray);
    [self tableView];
}

#pragma mark - 数据源代理方法
/**
 *  返回当前表格的分组数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.carArray.count;
}

/**
 *  返回当前组的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CarGroupModel *carGroup = self.carArray[section];
    
    return carGroup.cars.count;
}

/**
 *  返回表格的单元行
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableViewCellIdentifier = @"carTableViewCell";
    
    UITableViewCell *carTableViewCell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    
    if (nil == carTableViewCell) {
        carTableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellIdentifier];
    }
    
    CarGroupModel *carGroupModel = self.carArray[indexPath.section];
    CarModel *car = carGroupModel.cars[indexPath.row];
    
    carTableViewCell.imageView.image = [UIImage imageNamed:car.icon];
    carTableViewCell.textLabel.text = car.name;
    
    return carTableViewCell;
}

/**
 *  返回分组头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    CarGroupModel *carGroup = self.carArray[section];
    
    return carGroup.title;
}

/**
 *  返回右侧索引数据
 */
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    // 这里是KVC的知识点
    NSArray *carNames = [self.carArray valueForKeyPath:@"cars.name"];
    
    NSLog(@"%@", carNames);
    
    return [self.carArray valueForKeyPath:@"title"];
}

#pragma mark - 控件懒加载
/**
 *  tableView懒加载
 */
- (UITableView *)tableView {
    if (nil == _tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.dataSource = self;
        
        _tableView = tableView;
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

#pragma mark - 属性懒加载
/**
 *  汽车列表属性懒加载
 */
- (NSArray *)carArray {
    if (nil == _carArray) {
        _carArray = [CarGroupModel carGroupArray];
    }
    
    return _carArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
