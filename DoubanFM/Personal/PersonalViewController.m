//
//  PersonalViewController.m
//  DoubanFM
//
//  Created by bjmsp on 16/6/15.
//  Copyright (c) 2016年 DSP. All rights reserved.
//

#import "PersonalViewController.h"

@interface PersonalViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *infoTableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

static NSString *tableViewCellReuseIdentifier = @"tableViewCellReuseIdentifier";
@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    self.dataArray = @[@"我的私人兆赫",@"我的红心兆赫",@"豆瓣精选兆赫"];
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUI {
   [self.infoTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellReuseIdentifier];
    self.infoTableView.dataSource = self;
    self.infoTableView.delegate = self;
    self.infoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.infoTableView.backgroundColor = BACKGROUND_COLOR_BASE;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellReuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = BACKGROUND_COLOR_CLEAR;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(20, 24, cell.bounds.size.width-40, 40);
    NSString *str = [NSString stringWithFormat:@"       %@",self.dataArray[indexPath.row]];
    label.text = str;
    label.backgroundColor = BACKGROUND_COLOR_BASE_DEEP;
    
    [cell addSubview:label];

    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
