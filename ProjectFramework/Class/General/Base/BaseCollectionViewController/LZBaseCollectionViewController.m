//
//  LZBaseCollectionViewController.m
//  ProjectFramework
//
//  Created by 栗子 on 2019/4/18.
//  Copyright © 2019年 LZ. All rights reserved.
//

#import "LZBaseCollectionViewController.h"

@interface LZBaseCollectionViewController ()

@end

static NSString * const reuseIdentifier = @"Cell";


@implementation LZBaseCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
    }
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(0, 0);
}


#pragma mark - Lazyload
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout= [UICollectionViewFlowLayout new];
        self.layout=layout;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.frame.size.height) collectionViewLayout:layout];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (NSMutableArray *)dataAry {
    if (!_dataAry) {
        _dataAry = [NSMutableArray new];
    }
    return _dataAry;
}

- (void)dealloc {
    
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
}

@end
