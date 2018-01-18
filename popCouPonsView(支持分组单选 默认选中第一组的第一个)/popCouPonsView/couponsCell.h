//
//  couponsCell.h
//  popCouPonsView
//
//  Created by wangzhao on 2018/1/6.
//  Copyright © 2018年 wangzhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface couponsCell : UITableViewCell
/**标识选中的image*/
@property (nonatomic, strong) UIImageView *selectImage;
/**优惠券背景*/
@property (nonatomic, strong) UIImageView *couponsBgImage;
/**金钱数*/
@property (nonatomic, strong) UILabel *moneyLabel;
/**名称*/
@property (nonatomic, strong) UILabel *nameLabel;
/**单笔投资满多少使用*/
@property(nonatomic, strong) UILabel *oneInvestUse;
/**投资期限*/
@property(nonatomic, strong) UILabel *investTime;
/**有效期*/
@property(nonatomic, strong) UILabel *useInvestTime;










/**刷新状态*/
- (void)updateWith:(BOOL)isSeelected;

@end
