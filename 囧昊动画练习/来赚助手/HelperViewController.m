//
//  HelperViewController.m
//  囧昊动画练习
//
//  Created by wuhao on 16/2/26.
//  Copyright © 2016年 wuhao. All rights reserved.
//

#import "HelperViewController.h"
#import "UIColor+HexColor.h"
#import "YYKit.h"
//#import "YYTextView.h"
//#import "NSAttributedString+YYText.h"


#define navigationbarHeight self.navigationController.navigationBar.frame.size.height
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
#define normalGrayColor [UIColor colorWithHexString:@"#F3f3f3"]
#define expandGrayColor  [UIColor colorWithHexString:@"#f9f9f9"]
#define topNavigationbarColor [UIColor colorWithHexString:@"#d84a46"]
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


@interface HelperViewController ()<UITableViewDelegate,UITableViewDataSource>
{


    UITableView *table;//tableview
    UIImageView *topImageView;//顶部视图
    UIButton *contactButton;//联系按钮
    NSMutableIndexSet *expandedSections;
    NSArray *textArray;//文字标题
    NSArray *expandedTextArray;//展开后的文字标题
    UITextView *bangdingTf;//绑定的textView;
    YYTextView *bangdingYYTf;//绑定的YYTextView;

}
@end

@implementation HelperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title=@"帮助";
    
    //扩展区域
    if (!expandedSections)
    {
        expandedSections = [[NSMutableIndexSet alloc] init];
    }
    
    //文字标题
    if (!textArray) {
        textArray=@[@"关于我们",@"新手指南",@"账户绑定的相关问题",@"提现的相关问题",@"邀请好友赚钱的相关问题",@"做任务的相关问题",@"其他问题"];
    }
    
    if (!expandedTextArray) {
        expandedTextArray=@[@"你好这是测试文字,测试文字,测试文字,3214212132142132132142132132142132142132142132142121321421321dsgdsgdsfdsbvcxvsfdsfdssfdsafdsagdsafdsgdsfds",@"",@"",@"",@"",@"",@""];
    }
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"反馈" style:UIBarButtonItemStylePlain target:self action:@selector(callback)];
    

    //self.navigationController.navigationBar.barTintColor=[UIColor colorWithHexString:@"#e24a46"];
    self.navigationController.navigationBar.barTintColor=topNavigationbarColor;
    
    self.view.backgroundColor=normalGrayColor;
    
    [self initUI];
    

}

-(void)initUI{

    //顶部图片
    if (!topImageView) {
        topImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"img_help"]];
        CGFloat imageHeight=[UIImage imageNamed:@"img_help"].size.height;
        
        topImageView.frame=CGRectMake(0, self.navigationController.navigationBar.frame.size.height+20, screenWidth, imageHeight);
        topImageView.contentMode=UIViewContentModeScaleAspectFill;
        [self.view addSubview:topImageView];
    }
    //联系按钮
    if (!contactButton) {
        contactButton=[[UIButton alloc]init];
        contactButton.backgroundColor=[UIColor clearColor];
        contactButton.frame=CGRectMake(4, 5, self.navigationController.navigationBar.frame.size.width/4, self.navigationController.navigationBar.frame.size.height/2);
        contactButton.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2+60, self.navigationController.navigationBar.frame.size.height+100);
        [contactButton addTarget:self action:@selector(pressContactButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:contactButton];
    }
    
    if (!table) {
        CGFloat beginY=CGRectGetMaxY(contactButton.frame);
        table=[[UITableView alloc]initWithFrame:CGRectMake(0, beginY+20, screenWidth, screenHeight-navigationbarHeight) style:UITableViewStyleGrouped];
        table.delegate=self;
        table.dataSource=self;
        table.backgroundColor=normalGrayColor;
        [self.view addSubview:table];
        
    }
    
}
#pragma mark - Table View
- (BOOL)tableView:(UITableView *)tableView canCollapseSection:(NSInteger)section
{
    return YES;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self tableView:tableView canCollapseSection:section])
    {
        if ([expandedSections containsIndex:section])
        {
            return 2; // return rows when expanded
        }
        
        return 1; // only top row showing
    }
    
   // Return the number of rows in the section.
     return 2;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section==0) {
        return 20.f;
    }
    else
        return 0.000001f;
}



-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.00000001f;
}


/**
 *  定义高度
 *
 *  @param tableView table
 *  @param indexPath indexPath
 *
 *  @return 高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0 && indexPath.row==1) {
        return 200.f;
    }

    if (indexPath.section==2 && indexPath.row==1) {
        return 350.f;
    }

    return 44.f;


}



/**
 *  设置头视图
 *
 *  @param tableView table
 *  @param section   section
 *
 *  @return 头视图
 */
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        
        UIView *headerView=[[UIView alloc]init];
        headerView.backgroundColor=normalGrayColor;
        
        UIImageView *headViewIcon=[[UIImageView alloc]init];
        headViewIcon.image=[UIImage imageNamed:@"ico_help"];
        headViewIcon.frame=CGRectMake(0, 0, [UIImage imageNamed:@"ico_help"].size.width,[UIImage imageNamed:@"ico_help"].size.height);
        headViewIcon.center=CGPointMake(0+20, 10);
        
        UILabel *headViewLabel=[[UILabel alloc]init];
        headViewLabel.frame=CGRectMake(30, 0, 100, 10);
        
        headViewLabel.textAlignment=NSTextAlignmentLeft;
        headViewLabel.font=[UIFont systemFontOfSize:14];
        headViewLabel.text=@"常见问题";
        headViewLabel.textColor=[UIColor blackColor];
        
        [headerView addSubview:headViewIcon];
        [headViewIcon addSubview:headViewLabel];
        
        return headerView;
    }
    
    return nil;
}
    


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
 
    
    
//    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    

    
    // Configure the cell...
    
    if ([self tableView:tableView canCollapseSection:indexPath.section])
    {
        if (indexPath.row==0 )
        {
            // first row
//            cell.textLabel.text = [NSString stringWithFormat:@"Expandable cell %ld",(long)indexPath.section]; // only top row showing
            cell.textLabel.text = [NSString stringWithFormat:@"%@",textArray[indexPath.section]];
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            cell.backgroundColor=[UIColor whiteColor];
            
            if ([expandedSections containsIndex:indexPath.section])
            {
                UIImageView *upView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_up"]];
                upView.frame=CGRectMake(0, 0, [UIImage imageNamed:@"ico_up"].size.width, [UIImage imageNamed:@"ico_up"].size.height);
                upView.center=CGPointMake(screenWidth-[UIImage imageNamed:@"ico_up"].size.width-20, cell.center.y);
                
//                cell.accessoryView = [ALCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:ALCustomColoredAccessoryTypeUp];
                cell.accessoryView=upView;
            }
            else
            {
//                cell.accessoryView = [ALCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:ALCustomColoredAccessoryTypeDown];
                
                if (bangdingYYTf) {
                    [bangdingYYTf removeFromSuperview];
                }
                
                UIImageView *downView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_down"]];
                downView.frame=CGRectMake(0, 0, [UIImage imageNamed:@"ico_down"].size.width, [UIImage imageNamed:@"ico_down"].size.height);
                downView.center=CGPointMake(screenWidth-[UIImage imageNamed:@"ico_down"].size.width-20, cell.center.y);
                
                cell.accessoryView=downView;

                
            }
        }
        if (indexPath.row==1 && indexPath.section==2) {
            
            NSMutableAttributedString *originString=[[NSMutableAttributedString alloc]initWithString:@"   1. 提现前,一定要正确填写你的支付宝信息哟\n   2. 提现会在工作日24小时内到账,请耐心等待\n   3. '来赚'提现成功后,会有提示消息哟\n   4. 支付宝提现会收取1元手续费哟\n   Q:为什么提现会失败呢?\n   A:拒绝一起刷单哟,如果查出有刷单嫌疑,我们会限制你的提现哟!常见刷单现象:\n    A.同一个WiFi多台设备同时提现\n    B.同一个ID多个设备登录\n    C.同一个IP,或者IP段比较集中\n    支付宝信息有误,也会导致提现失败哟!\n    如果排除以上现象,仍无法提现,请联系客服!\n   可以微信提现吗?\n    您好,目前只支持支付宝提现哦!之后我们更努力,争取开通更多提现方式哦~" attributes:nil];
            originString.lineSpacing=10;
            originString.font=[UIFont systemFontOfSize:15];
        
            
            //更改段落样式
//            NSMutableParagraphStyle *paraStyle=[[NSMutableParagraphStyle alloc]init];
//            paraStyle.lineSpacing=10;
//            paraStyle.maximumLineHeight=30.f;
//            paraStyle.minimumLineHeight=30.f;
//            //paraStyle.lineHeightMultiple=1;
//            
//            NSDictionary *dic=@{NSParagraphStyleAttributeName:paraStyle};
//            [originString setAttributes:dic range:NSMakeRange(0, originString.length)];
            
            
//            //改变所有字体大小
//            NSDictionary *dicForAll=@{NSFontAttributeName:[UIFont systemFontOfSize:15]};
//            [originString setAttributes:dicForAll range:NSMakeRange(0,originString.length)];
            
            //加粗字体
            NSDictionary *boldDic1=@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15]};
            [originString setAttributes:boldDic1 range:NSMakeRange(102, 12)];
            //加粗字体
            NSDictionary *boldDic2=@{NSFontAttributeName:[UIFont  boldSystemFontOfSize:15]};
            [originString setAttributes:boldDic2 range:NSMakeRange(270, 12)];
            
            
//            if (!bangdingTf ||  bangdingTf.superview==nil) {
//                bangdingTf=[[UITextView alloc]init];
//                bangdingTf.attributedText=originString;
//              //  bangdingTf.font=[UIFont systemFontOfSize:15];
//                bangdingTf.frame=CGRectMake(0, 0, screenWidth, 350);
//                bangdingTf.editable=NO;
//                
//                [cell addSubview:bangdingTf];
//            }
            
            
            if (!bangdingYYTf || bangdingYYTf.superview==nil) {
                bangdingYYTf=[[YYTextView alloc]init];
                bangdingYYTf.attributedText=originString;
                bangdingYYTf.textContainerInset=UIEdgeInsetsMake(10, 10, 10, 10);
                bangdingYYTf.frame=CGRectMake(0, 0, screenWidth, 350);
                //如果是iPhone5的话,需要额外添加差额
                if (iPhone5) {
                    [bangdingYYTf setContentInset:UIEdgeInsetsMake(0, 0, 150, 0)];
                    bangdingYYTf.textContainerInset=UIEdgeInsetsMake(5, 5, 5, 5);

                }
                bangdingYYTf.editable=NO;
                [cell addSubview:bangdingYYTf];
                
            }
            
            cell.backgroundColor=expandGrayColor;
            
        }
    }
    
    
    if (indexPath.row==1 && indexPath.section!=2) {

        if (bangdingYYTf) {
            [bangdingYYTf removeFromSuperview];
        }
        
        
    }
  
    
    return  cell;
    


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self tableView:tableView canCollapseSection:indexPath.section])
    {
        if (!indexPath.row)
        {
            // only first row toggles exapand/collapse
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
            NSInteger section = indexPath.section;
            BOOL currentlyExpanded = [expandedSections containsIndex:section];
            NSInteger rows;
            
            NSMutableArray *tmpArray = [NSMutableArray array];
            
            if (currentlyExpanded)
            {
                rows = [self tableView:tableView numberOfRowsInSection:section];
                [expandedSections removeIndex:section];
            }
            else
            {
                [expandedSections addIndex:section];
                rows = [self tableView:tableView numberOfRowsInSection:section];
                
            }
            for (int i=1; i<rows; i++)
            {
                NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:i
                                                               inSection:section];
                [tmpArray addObject:tmpIndexPath];
            }
        
            
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            
            if (currentlyExpanded)
            {
           
                
                [tableView deleteRowsAtIndexPaths:tmpArray
                                 withRowAnimation:UITableViewRowAnimationTop];
                
//                cell.accessoryView = [ALCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:ALCustomColoredAccessoryTypeDown];
                
                UIImageView *downView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_down"]];
                downView.frame=CGRectMake(0, 0, [UIImage imageNamed:@"ico_down"].size.width, [UIImage imageNamed:@"ico_down"].size.height);
                downView.center=CGPointMake(screenWidth-[UIImage imageNamed:@"ico_down"].size.width-20, cell.center.y);
                
                cell.accessoryView=downView;

                
            }
            else
            {
                [tableView insertRowsAtIndexPaths:tmpArray
                                 withRowAnimation:UITableViewRowAnimationTop];
                
                
//                
//                cell.accessoryView =  [ALCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:ALCustomColoredAccessoryTypeUp];

                UIImageView *upView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_up"]];
                upView.frame=CGRectMake(0, 0, [UIImage imageNamed:@"ico_up"].size.width, [UIImage imageNamed:@"ico_up"].size.height);
                upView.center=CGPointMake(screenWidth-[UIImage imageNamed:@"ico_up"].size.width-20, cell.center.y);
                
                //                cell.accessoryView = [ALCustomColoredAccessory accessoryWithColor:[UIColor grayColor] type:ALCustomColoredAccessoryTypeUp];
                cell.accessoryView=upView;

                
                
                
            }
        }
        else {
            NSLog(@"Selected Section is %ld and subrow is %ld ",(long)indexPath.section ,(long)indexPath.row);
            
        }
        
    }

    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
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
