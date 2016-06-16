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

#define leftScale 0.6

@interface MainViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *baseScrollView;

@property (nonatomic, strong) MainTabBarController *mainTabBarController;
@property (nonatomic, strong) PersonalViewController *personal;
@property (nonatomic, strong) UIView *homeView;
@property (nonatomic, strong) UIView *personalView;

@property (nonatomic, strong) UIButton *leftCoverButton;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = BACKGROUND_COLOR_WHITE;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 点击事件
- (void)clickLeftCoverButton:(UIButton *)button {
    [self.baseScrollView setContentOffset:CGPointMake(MAIN_SCREEN_WIDTH*leftScale, 0) animated:YES];
}

#pragma mark- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat x = scrollView.contentOffset.x;
    CGFloat distance = MAIN_SCREEN_WIDTH*leftScale - x;
    self.homeView.frame = CGRectMake(MAIN_SCREEN_WIDTH*leftScale, distance*0.5, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT - distance);
    if (x==0) {
        self.leftCoverButton.hidden = NO;
    }else {
        self.leftCoverButton.hidden = YES;
    }
}

#pragma mark - setUI
- (void)setUI {
    
    [self.view addSubview:self.baseScrollView];
    self.baseScrollView.contentOffset = CGPointMake(MAIN_SCREEN_WIDTH*leftScale, 0);
    
    [self addChildViewController:self.mainTabBarController];
    [self.baseScrollView addSubview:self.mainTabBarController.view];
    self.homeView = self.mainTabBarController.view;
    
    [self addChildViewController:self.personal];
    [self.baseScrollView addSubview:self.personal.view];
    self.personalView = self.personal.view;
    
    self.homeView.frame = CGRectMake(MAIN_SCREEN_WIDTH*leftScale, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT);
    self.personalView.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH*leftScale, MAIN_SCREEN_HEIGHT);
    
    [self.baseScrollView addSubview:self.leftCoverButton];

}

#pragma mark- lazy

- (UIScrollView *)baseScrollView {
    if (!_baseScrollView) {
        _baseScrollView = [[UIScrollView alloc] init];
        _baseScrollView.contentSize = CGSizeMake((1+leftScale)*MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT);
        _baseScrollView.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT);
        _baseScrollView.backgroundColor = [UIColor clearColor];
        _baseScrollView.bounces = NO;
        _baseScrollView.delegate = self;
        _baseScrollView.pagingEnabled = YES;
        _baseScrollView.showsHorizontalScrollIndicator = NO;
        
//        UIImageView *imageView = [[UIImageView alloc] init];
//        imageView.frame = CGRectMake(0, 0.2*MAIN_SCREEN_HEIGHT, MAIN_SCREEN_WIDTH*leftScale, MAIN_SCREEN_HEIGHT*0.6);
//        imageView.backgroundColor = BACKGROUND_COLOR_HOME;
//        [_baseScrollView addSubview:imageView];
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

- (UIButton *)leftCoverButton {
    if (!_leftCoverButton) {
        _leftCoverButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftCoverButton.frame = CGRectMake(MAIN_SCREEN_WIDTH*leftScale, 0, (1-leftScale)*MAIN_SCREEN_WIDTH, MAIN_SCREEN_HEIGHT);
        [_leftCoverButton addTarget:self action:@selector(clickLeftCoverButton:) forControlEvents:UIControlEventTouchUpInside];
        _leftCoverButton.hidden = YES;
        _leftCoverButton.backgroundColor = [UIColor clearColor];
    }
    return _leftCoverButton;
}
@end
