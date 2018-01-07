//
//  couponsCell.m
//  popCouPonsView
//
//  Created by wangzhao on 2018/1/6.
//  Copyright © 2018年 wangzhao. All rights reserved.
//

#import "couponsCell.h"

@implementation couponsCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews{
   
    [self.contentView addSubview:self.couponsBgImage];
     [self.contentView addSubview:self.selectImage];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.oneInvestUse];
    [self.contentView addSubview:self.investTime];
    [self.contentView addSubview:self.useInvestTime];
}



- (void)layoutSubviews{
    [super layoutSubviews];
    self.selectImage.frame = CGRectMake(self.frame.size.width - 40, 10, 30, 30);
    self.couponsBgImage.frame = CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height-20);
    self.moneyLabel.frame = CGRectMake(40, 40, 100, 40);
    self.nameLabel.frame = CGRectMake(CGRectGetMaxX(self.moneyLabel.frame)+40, 30, 100, 20);
    self.oneInvestUse.frame = CGRectMake(CGRectGetMinX(self.nameLabel.frame), CGRectGetMaxY(self.nameLabel.frame)+10, 200, 20);
    self.investTime.frame = CGRectMake(CGRectGetMinX(self.nameLabel.frame), CGRectGetMaxY(self.oneInvestUse.frame)+10, 300, 20);
    self.useInvestTime.frame = CGRectMake(CGRectGetMinX(self.oneInvestUse.frame), CGRectGetMaxY(self.investTime.frame)+10, 200, 20);
    
    
    
}
- (UIImageView *)selectImage{
    if (_selectImage == nil) {
        _selectImage = [[UIImageView alloc] init];
        
    }
    return _selectImage;
}
/**优惠券背景图*/
- (UIImageView *)couponsBgImage{
    if (_couponsBgImage == nil) {
        _couponsBgImage = [[UIImageView alloc] init];
   
    }
    return _couponsBgImage;
}

/**金钱 百分比 价值*/
- (UILabel *)moneyLabel{
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textAlignment = NSTextAlignmentLeft;
        _moneyLabel.font = [UIFont systemFontOfSize:30];
        _moneyLabel.text = @"200";
        
    }
    return _moneyLabel;
}
/**名称*/
- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.font = [UIFont systemFontOfSize:20];
        _nameLabel.text = @"返现券";
    }
    return _nameLabel;
}
/**单笔投资满XX元*/
- (UILabel *)oneInvestUse{
    if (_oneInvestUse == nil) {
        _oneInvestUse = [[UILabel alloc] init];
        _oneInvestUse.textAlignment = NSTextAlignmentLeft;
        _oneInvestUse.text = @"单笔投资满20000元";
        _oneInvestUse.font = [UIFont systemFontOfSize:13];
    }
    return _oneInvestUse;
}
/**投资期限*/
- (UILabel *)investTime{
    if (_investTime == nil) {
        _investTime = [[UILabel alloc] init];
        _investTime.textAlignment = NSTextAlignmentLeft;
        _investTime.text = @"投资期限>=30天(活动标,新手标除外)";
        _investTime.font = [UIFont systemFontOfSize:13];
    }
    return _investTime;
}
/**有效期*/
- (UILabel *)useInvestTime{
    if (_useInvestTime == nil) {
        _useInvestTime = [[UILabel alloc] init];
        _useInvestTime.textAlignment = NSTextAlignmentLeft;
        _useInvestTime.font = [UIFont systemFontOfSize:13];
        _useInvestTime.text = @"有效期至 2018-01-06";
    }
    return _useInvestTime;
}



#pragma mark 刷新cell状态
- (void)updateWith:(BOOL)isSeelected{
    
    if (isSeelected) {//选中
        [self IsSelectedStyle];
    }else{//非选中
        [self NoSelectedStyle];
    }
}

/**选中*/
- (void)IsSelectedStyle{
     self.selectImage.image = [UIImage imageNamed:@"checked"];
    self.couponsBgImage.backgroundColor = [UIColor redColor];
    self.moneyLabel.textColor = [UIColor whiteColor];
    self.nameLabel.textColor = [UIColor whiteColor];
    self.oneInvestUse.textColor = [UIColor whiteColor];
    self.investTime.textColor = [UIColor whiteColor];
    self.useInvestTime.textColor = [UIColor whiteColor];
}

/**非选中*/
- (void)NoSelectedStyle{
     self.selectImage.image = [UIImage imageNamed:@"unchecked"];
    self.couponsBgImage.backgroundColor = [UIColor whiteColor];
    self.moneyLabel.textColor = [UIColor lightGrayColor];
    self.nameLabel.textColor = [UIColor lightGrayColor];
    self.oneInvestUse.textColor = [UIColor lightGrayColor];
    self.investTime.textColor = [UIColor lightGrayColor];
    self.useInvestTime.textColor = [UIColor lightGrayColor];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
