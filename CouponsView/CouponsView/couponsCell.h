//
//  couponsCell.h
//  CouponsView
//
//  Created by wangzhao on 2018/1/8.
//  Copyright © 2018年 wangzhao. All rights reserved.
//
#import "couponsModel.h"
#import <UIKit/UIKit.h>

@interface couponsCell : UITableViewCell
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *bgImage;
@property (nonatomic, strong) UIButton *selectedBtn;
@property (nonatomic, strong) void(^tapBlock)(NSMutableArray *arr);
- (void)updateCell:(BOOL)isSelected;

- (void)configureModel:(couponsModel*)model;
@end
