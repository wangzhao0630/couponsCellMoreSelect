//
//  couponsCell.m
//  CouponsView
//
//  Created by wangzhao on 2018/1/8.
//  Copyright © 2018年 wangzhao. All rights reserved.
//

#import "couponsCell.h"

@implementation couponsCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.bgImage];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.selectedBtn];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.nameLabel.frame = CGRectMake(30, 30, 200, 40);
    self.selectedBtn.frame = CGRectMake(300, 40,40, 40);
    self.bgImage.frame = self.contentView.frame;
}
- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.text = @"返现券";
    }
    return _nameLabel;
}

- (UIImageView *)bgImage{
    if (_bgImage == nil) {
        _bgImage = [[UIImageView alloc] init];
    
    }
    return _bgImage;
}

- (UIButton *)selectedBtn{
    if (_selectedBtn == nil) {
        _selectedBtn.selected = NO;
        _selectedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_selectedBtn  setTitle:@"正常" forState:UIControlStateNormal];
        [_selectedBtn setTitle:@"选中" forState:UIControlStateSelected];
        _selectedBtn.backgroundColor = [UIColor redColor];
//        [_selectedBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectedBtn;
    
}

- (void)updateCell:(BOOL)isSelected{
    if (isSelected == YES) {
        self.selectedBtn.selected = YES;
        self.bgImage.backgroundColor = [UIColor redColor];
        self.nameLabel.textColor = [UIColor whiteColor];
    }else{
        self.selectedBtn.selected = NO;
        self.bgImage.backgroundColor = [UIColor whiteColor];
        self.nameLabel.textColor = [UIColor blackColor];
    
    }
}

- (void)configureModel:(couponsModel *)model{
    if ([model.status isEqualToString:@"1"]) {
        self.selectedBtn.hidden = YES;
        self.bgImage.backgroundColor = [UIColor blackColor];
    }
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
