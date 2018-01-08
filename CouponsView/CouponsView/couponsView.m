//
//  couponsView.m
//  CouponsView
//
//  Created by wangzhao on 2018/1/8.
//  Copyright © 2018年 wangzhao. All rights reserved.
//
#import "couponsCell.h"
#import "couponsView.h"
#import "couponsModel.h"
@implementation couponsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.couponsTable];
        [self addSubview:self.sureBtn];
        
        self.dataArray = [NSMutableArray arrayWithCapacity:0];
       
        NSArray *array = @[@"0",@"0",@"0",@"0",@"0",@"0",@"1",@"1"];
        for (int i = 0; i<8; i++) {
             couponsModel *model = [[couponsModel alloc] init];
            model.status = array[i];
            [self.dataArray addObject:model];
        }
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.sureBtn.frame = CGRectMake(self.frame.size.width - 80, 260, 60, 40);
}


- (UITableView *)couponsTable{
    if (_couponsTable == nil) {
        _couponsTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 300, self.frame.size.width, self.frame.size.height-300) style:UITableViewStylePlain];
        _couponsTable.delegate = self;
        _couponsTable.dataSource = self;
        [_couponsTable registerClass:[couponsCell class] forCellReuseIdentifier:@"cell"];
        [_couponsTable registerClass:[couponsCell class] forCellReuseIdentifier:@"cell1"];
    }
    return _couponsTable;
}

- (UIButton *)sureBtn{
    if (_sureBtn == nil) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    couponsModel *model =self.dataArray [indexPath.row];
    if ([model.status isEqualToString:@"1"]) {
           couponsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
          [cell configureModel:self.dataArray[indexPath.row]];
        return cell;
    }
    couponsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
   
    if (self.selectedArr.count != 0) {
        
        for (int i = 0; i < self.selectedArr.count; i ++) {
            
            int row = [self.selectedArr[i] intValue];
            
            if (indexPath.row == row) {
                
                [cell updateCell:YES];
         
                break;
            }else{
                [cell updateCell:NO];

            }
        }
        
    }else{
        [cell updateCell:NO];
         [cell configureModel:self.dataArray[indexPath.row]];
        
    }
   
    [cell.selectedBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
 
    return cell;
}

- (void)click:(UIButton *)btn{
    btn.selected = !btn.selected;
    couponsCell *cell = (couponsCell *)[self recursionToCell:btn];
    NSIndexPath *indexPath = [self.couponsTable indexPathForCell:cell];
    if (btn.selected == YES) {

        NSLog(@"点击的是第%zd行",indexPath.row);
        [self.selectedArr  addObject:[NSString stringWithFormat:@"%ld",indexPath.row]];
        [self.couponsTable reloadData];
      
    }else{
    
        [self.selectedArr removeObject:[NSString stringWithFormat:@"%ld",indexPath.row]];
        [self.couponsTable reloadData];
    }
    
}
- (UITableViewCell *)recursionToCell:(UIView *) curView{
    if (curView == nil) {
        return nil;
    }
    if ([curView.superview isKindOfClass:[UITableViewCell class]]) {
        return (UITableViewCell *)curView.superview;
    }
    else {
        return [self recursionToCell:curView.superview];
    }
}
- (NSMutableArray *)selectedArr{
    if (_selectedArr == nil) {
        _selectedArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _selectedArr;
}

- (void)btnClick:(UIButton*)btn{
    if (self.tapCalk) {
        self.tapCalk();
    }
}

@end
