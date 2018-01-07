//
//  ViewController.m
//  popCouPonsView
//
//  Created by wangzhao on 2018/1/5.
//  Copyright © 2018年 wangzhao. All rights reserved.
//
#import "popCouponsView.h"
#import "ViewController.h"

@interface ViewController ()
/**加息券列表*/
@property(nonatomic, strong) popCouponsView *couponsView;
/**view*/
@property(nonatomic, strong) UIView *subView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.subView];
    [self.view addSubview:self.couponsView];
    __weak typeof(self) weakSelf = self;
    self.couponsView.tapCallk = ^{
        
        [UIView animateWithDuration:0.2 animations:^{
            [weakSelf.couponsView setFrame:CGRectMake(0, weakSelf.view.frame.size.height, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height)];
        }];
        
      
    };
    

}

- (IBAction)popView:(id)sender {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        [weakSelf.couponsView setFrame:self.view.frame];
    }];
}


-(UIView *)subView{
    if (_subView == nil) {
        _subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        _subView.backgroundColor = [UIColor yellowColor];
    }
    return _subView;
}


- (popCouponsView *)couponsView{
    if (_couponsView == nil) {
        _couponsView = [[popCouponsView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
     
    }
    return _couponsView;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
