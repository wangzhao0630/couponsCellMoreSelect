//
//  ViewController.m
//  CouponsView
//
//  Created by wangzhao on 2018/1/8.
//  Copyright © 2018年 wangzhao. All rights reserved.
//
#import "couponsView.h"
#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) couponsView *couView;
@property(nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.couView];
    __weak typeof(self) weakSelf = self;
    self.couView.tapCalk = ^{
        [UIView animateWithDuration:0.2 animations:^{
            [weakSelf.couView setFrame:CGRectMake(0, weakSelf.view.frame.size.height, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height)];
        }];
    };
}

- (IBAction)pooCouponsView:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        [self.couView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    }];
}


- (couponsView *)couView{
    if (_couView == nil) {
        _couView = [[couponsView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
        _couView.backgroundColor = [UIColor colorWithRed:255/255 green:20/255 blue:29/255 alpha:0.2];
    }
    return _couView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
