//
//  LZBaseTableViewController.h
//  ProjectFramework
//
//  Created by 栗子 on 2019/4/18.
//  Copyright © 2019年 LZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LZBaseTableViewController : LZBaseViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)  UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataAry;           //cell相关data



@end

NS_ASSUME_NONNULL_END
