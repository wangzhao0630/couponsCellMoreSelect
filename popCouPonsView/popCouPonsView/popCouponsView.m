//
//  popCouponsView.m
//  popCouPonsView
//
//  Created by wangzhao on 2018/1/5.
//  Copyright © 2018年 wangzhao. All rights reserved.
//

#import "popCouponsView.h"
#import "couponsCell.h"
#define COUPONS_CELL_IDENTIFIER  @"coupons_cells_identifier"

@implementation popCouponsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:255/255.0 green:20/255.0 blue:26/255.0 alpha:0.5];
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews{
    [self addSubview:self.couponsTable];
    [self addSubview:self.sureBtn];
    [self addSubview:self.cancelBtn];
    
}


#pragma mark lazy

- (UITableView *)couponsTable{
    if (_couponsTable == nil) {
        _couponsTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 300, self.frame.size.width, self.frame.size.height - 300) style:UITableViewStylePlain];
        _couponsTable.delegate = self;
        _couponsTable.dataSource = self;
//            _couponsTable.editing = YES;
        _couponsTable.backgroundColor = [UIColor redColor];
        [_couponsTable registerClass:[couponsCell class] forCellReuseIdentifier:COUPONS_CELL_IDENTIFIER];
    }
    return _couponsTable;
}


- (UIButton *)sureBtn{
    if (_sureBtn == nil) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureBtn.frame = CGRectMake(CGRectGetMaxX(self.frame)- 60, 260, 40, 40);
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}

- (UIButton *)cancelBtn{
    if (_cancelBtn == nil) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = CGRectMake(60, 260, 40, 40);
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

#pragma mark 数据数组初始化
- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
        
    }
    return _dataArr;
}

- (NSMutableArray *)resultArr{
    if (_resultArr == nil) {
        _resultArr  = [NSMutableArray array];
    }
    return _resultArr;
}
#pragma mark UITableViewDatasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    couponsCell *cell = [tableView dequeueReusableCellWithIdentifier:COUPONS_CELL_IDENTIFIER forIndexPath:indexPath];
    if (self.resultArr.count != 0) {
        
        for (int i = 0; i < self.resultArr.count; i ++) {
            
            int row = [self.resultArr[i] intValue];
            
            if (indexPath.row == row) {
                
                [cell updateWith:YES];
                break;
            }else{
                [cell updateWith:NO];
            }
        }
        
    }else{
        [cell updateWith:NO];
     
        
    }
    
    return cell;
}
#pragma mark UITableViewDelegate
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
//
//}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.resultArr.count != 0) {
        
        for (int i = 0; i < self.resultArr.count; i ++) {
            
            int row = [self.resultArr[i] intValue];
            
            if (indexPath.row == row) {
                
                [self.resultArr removeObjectAtIndex:i];
                
                break;
                
            }
            
            if (i == self.resultArr.count - 1) {
                
                if (indexPath.row != row) {
                    
                    [self.resultArr addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
                }
                
                break;
                
            }
            
        }
        
    }else{
        
        [self.resultArr addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
        
    }
    
    [self.couponsTable reloadData];
    
    
}

- (void)click{
    if (_tapCallk) {
        
        self.tapCallk();
    }
    if (_SelectBlock) {
        self.SelectBlock(self.resultArr);
    }
}

- (void)cancelClick{
    if (_tapCallk) {
        
        self.tapCallk();
    }
    if (_SelectBlock) {
        self.SelectBlock(self.resultArr);
    }
}



@end
