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
#import "GuodongViewController.h"

/*********************测试来赚助手**********************************************/
#import "HelperViewController.h"

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    NSArray *dataArray;
    UITableView *table;


}

@end

@implementation RootViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataArray=@[@"边框动画",@"时钟自定义动画",@"果冻动画",@"来赚助手"];
    

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
    
    //边框动画
    BorderAnimationViewController *borderAnimationVC=[[BorderAnimationViewController alloc]init];
    //自定义属性动画,钟表动画
    CustomPropertyViewController *customPropertyAnimationVC=[[CustomPropertyViewController alloc]initWithNibName:@"CustomPropertyViewController" bundle:nil];
    //果冻动画
    GuodongViewController  *guodongAnimationVC=[[GuodongViewController alloc]init];
    

    HelperViewController *laizhuanHelp=[[HelperViewController alloc]init];

    
    
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:borderAnimationVC animated:YES];
            break;
            
          case 1:
            [self.navigationController pushViewController:customPropertyAnimationVC animated:YES];
            
            case 2:
            [self.navigationController pushViewController:guodongAnimationVC animated:YES];
            
           case 3 :
            [self.navigationController pushViewController:laizhuanHelp animated:YES];
            
            
            
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
