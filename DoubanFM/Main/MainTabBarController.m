//
//  MainTabBarController.m
//  DoubanFM
//
//  Created by bjmsp on 16/6/15.
//  Copyright (c) 2016年 DSP. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeViewController *home = [[HomeViewController alloc] init];
    home.view.backgroundColor = [UIColor clearColor];
    UINavigationController *nv1 = [[UINavigationController alloc] initWithRootViewController:home];
    nv1.title = @"FM1.0";
    
    HomeViewController *home2 = [[HomeViewController alloc] init];
    home2.view.backgroundColor = [UIColor clearColor];
    UINavigationController *nv2 = [[UINavigationController alloc] initWithRootViewController:home2];
    nv2.title = @"FM2.0";
    
    self.viewControllers = @[nv1,nv2];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
