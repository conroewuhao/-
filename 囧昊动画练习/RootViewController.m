//
//  RootViewController.m
//  囧昊动画练习
//
//  Created by wuhao on 16/2/23.
//  Copyright © 2016年 wuhao. All rights reserved.
//

#import "RootViewController.h"
#import "BorderAnimationViewController.h"
#import "CustomPropertyViewController.h"


@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    NSArray *dataArray;
    UITableView *table;


}

@end

@implementation RootViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataArray=@[@"边框动画",@"时钟自定义动画"];
    
    
    table=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    table.delegate=self;
    table.dataSource=self;
    [self.view addSubview:table];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"cellId";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text=dataArray[indexPath.row];
    
    return cell;
    
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return dataArray.count;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    

    
    [table deselectRowAtIndexPath:indexPath animated:YES];
    
    BorderAnimationViewController *borderAnimationVC=[[BorderAnimationViewController alloc]init];
    CustomPropertyViewController *customPropertyAnimationVC=[[CustomPropertyViewController alloc]initWithNibName:@"CustomPropertyViewController" bundle:nil];
    
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:borderAnimationVC animated:YES];

            break;
            
          case 1:
            
            [self.navigationController pushViewController:customPropertyAnimationVC animated:YES];
            
        default:
            nil;
            break;
    }

}


-(void)dealloc
{


    NSLog(@"注销了!");



}



@end
