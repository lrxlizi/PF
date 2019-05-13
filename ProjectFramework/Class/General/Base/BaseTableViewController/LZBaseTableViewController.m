//
//  LZBaseTableViewController.m
//  ProjectFramework
//
//  Created by 栗子 on 2019/4/18.
//  Copyright © 2019年 LZ. All rights reserved.
//

#import "LZBaseTableViewController.h"

@implementation LZBaseTableViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
    }
    
    
}
#pragma mark - TableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}


#pragma mark - Lazyload
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.frame.size.height-44) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView=[UIView new];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.right.mas_offset(0);
            make.top.mas_offset(0);
            make.bottom.mas_offset(0);
        }];
    }
    return _tableView;
}

- (NSMutableArray *)dataAry {
    if (!_dataAry) {
        _dataAry = [NSMutableArray new];
    }
    return _dataAry;
}

- (void)dealloc {
    
    _tableView.dataSource = nil;
    _tableView.delegate = nil;
}

@end
