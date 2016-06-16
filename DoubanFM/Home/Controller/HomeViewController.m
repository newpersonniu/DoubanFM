//
//  HomeViewController.m
//  DoubanFM
//
//  Created by bjmsp on 16/6/13.
//  Copyright (c) 2016年 DSP. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    label.text = @"";
//    self.view.backgroundColor = BACKGROUND_COLOR_HOME;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
