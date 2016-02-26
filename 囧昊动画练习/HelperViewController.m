//
//  HelperViewController.m
//  囧昊动画练习
//
//  Created by wuhao on 16/2/26.
//  Copyright © 2016年 wuhao. All rights reserved.
//

#import "HelperViewController.h"
#import "UIColor+HexColor.h"

#define navigationbarHeight self.navigationController.navigationBar.frame.size.height;


@interface HelperViewController ()<UITableViewDelegate,UITableViewDataSource>
{


    UITableView *table;//tableview
    UIImageView *topImageView;//顶部视图
    UIButton *contactButton;//联系按钮


}
@end

@implementation HelperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=@"帮助";
    
    NSLog(@"%@",self.navigationController);
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"反馈" style:UIBarButtonItemStylePlain target:self action:@selector(callback)];
    

    self.navigationController.navigationBar.barTintColor=[UIColor colorWithHexString:@"#e24a46"];
    
    [self initUI];
}

-(void)initUI{

    if (!topImageView) {
        topImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"img_help"]];
        CGFloat imageHeight=[UIImage imageNamed:@"img_help"].size.height;
        topImageView.frame=CGRectMake(0, self.navigationController.navigationBar.frame.size.height+20, self.view.frame.size.width, imageHeight);
        NSLog(@"%@",NSStringFromCGRect(topImageView.frame));
        [self.view addSubview:topImageView];
    }
    if (!contactButton) {
        contactButton=[[UIButton alloc]init];
        contactButton.backgroundColor=[UIColor whiteColor];
        contactButton.frame=CGRectMake(4, 5, self.navigationController.navigationBar.frame.size.width/4, self.navigationController.navigationBar.frame.size.height/2);
        contactButton.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2+60, self.navigationController.navigationBar.frame.size.height+100);
        [contactButton addTarget:self action:@selector(pressContactButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:contactButton];
    }


    
}





/**
 *  反馈方法的实现
 */
-(void)callback{

    NSLog(@"反馈!");
}


/**
 *  立即联系按钮的实现
 */
-(void)pressContactButton{
    NSLog(@"立即联系!");

}






@end
