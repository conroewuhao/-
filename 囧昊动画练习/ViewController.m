//
//  ViewController.m
//  QQfresh
//
//  Created by 阿城 on 15/11/23.
//  Copyright © 2015年 阿城. All rights reserved.
//

#import "ViewController.h"
#import "SCFreshView.h"
#import "UIView+Frame.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tab;

@property (nonatomic ,weak) SCFreshView *heard;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tab.tableFooterView = [UIView new];
    self.tab.allowsSelection = NO;
    
    SCFreshView *heard = [SCFreshView new];
    _heard = heard;
    [self.tab addSubview:heard];
    [heard addTarget:self action:@selector(doRefresh) forControlEvents:UIControlEventValueChanged];
}

- (void)doRefresh{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_heard endRefresh];
    });
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

@end
