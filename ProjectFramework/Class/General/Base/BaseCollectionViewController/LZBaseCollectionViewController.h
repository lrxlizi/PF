//
//  LZBaseCollectionViewController.h
//  ProjectFramework
//
//  Created by 栗子 on 2019/4/18.
//  Copyright © 2019年 LZ. All rights reserved.
//

#import "LZBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LZBaseCollectionViewController : LZBaseViewController<UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *layout;


@property (nonatomic,strong) NSMutableArray *dataAry;


@end

NS_ASSUME_NONNULL_END
