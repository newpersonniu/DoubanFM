//
//  MainViewController.m
//  DoubanFM
//
//  Created by bjmsp on 16/6/15.
//  Copyright (c) 2016年 DSP. All rights reserved.
//

#import "MainViewController.h"
#import "MainTabBarController.h"
#import "PersonalViewController.h"

@interface MainViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *baseScrollView;

@property (nonatomic, strong) MainTabBarController *mainTabBarController;
@property (nonatomic, strong) PersonalViewController *personal;
@property (nonatomic, strong) UIView *homeView;
@property (nonatomic, strong) UIView *personalView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = BACKGROUND_COLOR_WHITE;
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat x = scrollView.contentOffset.x;
    CGFloat distance = MAIN_SCREEN_WIDTH - x;
    self.homeView.frame = CGRectMake(MAIN_SCREEN_WIDTH, distance*0.5, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT - distance);
}

#pragma mark - setUI
- (void)setUI {
    
    [self.view addSubview:self.baseScrollView];
    self.baseScrollView.contentOffset = CGPointMake(MAIN_SCREEN_WIDTH, 0);
    
    [self addChildViewController:self.mainTabBarController];
    [self.baseScrollView addSubview:self.mainTabBarController.view];
    self.homeView = self.mainTabBarController.view;
    
    [self addChildViewController:self.personal];
    [self.baseScrollView addSubview:self.personal.view];
    self.personalView = self.personal.view;
    
    self.homeView.frame = CGRectMake(MAIN_SCREEN_WIDTH, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT);
    self.personalView.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT);

}

#pragma mark- lazy

- (UIScrollView *)baseScrollView {
    if (!_baseScrollView) {
        _baseScrollView = [[UIScrollView alloc] init];
        _baseScrollView.contentSize = CGSizeMake(2*MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT);
        _baseScrollView.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT);
        _baseScrollView.backgroundColor = [UIColor redColor];
        _baseScrollView.bounces = NO;
        _baseScrollView.delegate = self;
    }
    return _baseScrollView;
}

- (MainTabBarController *)mainTabBarController {
    if (!_mainTabBarController) {
        _mainTabBarController = [[MainTabBarController alloc] init];
    }
    return _mainTabBarController;
}
- (PersonalViewController *)personal {
    if (!_personal) {
        _personal = [[PersonalViewController alloc] init];
    }
    return _personal;
}
@end
