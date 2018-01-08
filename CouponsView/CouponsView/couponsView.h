//
//  couponsView.h
//  CouponsView
//
//  Created by wangzhao on 2018/1/8.
//  Copyright © 2018年 wangzhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface couponsView : UIView<UITableViewDelegate,UITableViewDataSource>
/**table*/
@property(nonatomic, strong) UITableView *couponsTable;
/**选中的cell数组数据*/
@property(nonatomic, strong) NSMutableArray *selectedArr;
/**加载的数据*/
@property (nonatomic, strong) NSMutableArray *dataArray;


/**btn*/
@property(nonatomic, strong) UIButton *sureBtn;
/**block*/
@property(nonatomic, copy) void(^tapCalk)(void);


@end
