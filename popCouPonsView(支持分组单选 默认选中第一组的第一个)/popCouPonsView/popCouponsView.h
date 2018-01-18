//
//  popCouponsView.h
//  popCouPonsView
//
//  Created by wangzhao on 2018/1/5.
//  Copyright © 2018年 wangzhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface popCouponsView : UIView<UITableViewDelegate,UITableViewDataSource>
/**列表*/
@property (nonatomic, strong) UITableView *couponsTable;
/**确认按钮*/
@property (nonatomic, strong) UIButton *sureBtn;
/**取消按钮*/
@property (nonatomic, strong) UIButton *cancelBtn;
/**回调block*/
@property (nonatomic, copy) void(^tapCallk)(void);
/**数据数组*/
@property (strong, nonatomic) NSMutableArray *dataArr;
/**筛选的数据数组*/
@property (strong, nonatomic) NSMutableArray *resultArr;

/**选中的数组2*/
@property (nonatomic, strong) NSMutableArray *resultArr2;
/**传入的回调(选择的结果数组)*/
@property (nonatomic,copy) void(^SelectBlock)(NSMutableArray *selectArr);






@end
