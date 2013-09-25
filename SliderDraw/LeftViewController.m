//
//  LeftViewController.m
//  SliderDraw
//
//  Created by Sinosoft on 9/9/13.
//  Copyright (c) 2013 com.Sinosoft. All rights reserved.
//

#import "LeftViewController.h"
#import "AddFriendsViewController.h"
#import "MMDrawerController.h"
#import "FriendsCircleViewController.h"
#import "SettingViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController
@synthesize leftTableView = _leftTableView;
@synthesize dataArray = _dataArray;
@synthesize imageArray = _imageArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightTextColor]];
    [self.navigationController.navigationBar setHidden:YES];
    
    // 头像部分
    UIButton* profileButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [profileButton setFrame:CGRectMake(-40, -60, 220,240)];
    [profileButton setImage:[UIImage imageNamed:@"yixin_profile_button_bg_normal.9.png"] forState:UIControlStateNormal];
    [profileButton setImage:[UIImage imageNamed:@"yixin_profile_button_bg_pressed.9"] forState:UIControlStateHighlighted];
    [self.view addSubview:profileButton];
    
    // 默认头像
    UIImageView* portrait = [[UIImageView alloc] initWithFrame:CGRectMake(85, 90, 50, 50)];
    [portrait setImage:[UIImage imageNamed:@"contacts_none_localcontacts_icon.png"]];
    [profileButton addSubview:portrait];
    
    // 名字
    UILabel* name = [[UILabel alloc ] initWithFrame:CGRectMake( 50,100, 50, 20)];
    name.text = @"赵健";
    name.textColor = [UIColor whiteColor];
    name.backgroundColor = [UIColor clearColor];
    [self.view addSubview:name];
    
    // 左视图中的表格
    _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 150, 150, 150) style:UITableViewStylePlain];
    _leftTableView.delegate = self;
    _leftTableView.dataSource = self;
    [_leftTableView setScrollEnabled:NO];
    [self.view addSubview: _leftTableView];
    
    // 表格中的数据源
    _dataArray = [[NSMutableArray alloc] initWithCapacity:10];
    [_dataArray addObject:@"易信"];
    [_dataArray addObject:@"朋友圈"];
    [_dataArray addObject:@"设置"];
    
    // 表格中图片数组
    _imageArray = [[NSMutableArray alloc] initWithCapacity:10];
    [_imageArray addObject:@"tool_box_fragment_yixin_icon.png"];
    [_imageArray addObject:@"tool_box_friend_icon.png"];
    [_imageArray addObject:@"tool_box_fragment_settings_icon.png"];

                   
    
    // 邀请好友按钮
    UIButton* addFriends = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [addFriends setFrame:CGRectMake(5, self.view.bounds.size.height-44-30, 150-5-5 , 30)];
    [addFriends setTitle:@"邀请好友" forState:UIControlStateNormal];
    [addFriends handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        NSLog(@"添加好友");
        AddFriendsViewController* add = [[AddFriendsViewController alloc] init];
        UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:add];
        [[self mm_drawerController] setCenterViewController:nav withCloseAnimation:YES completion:nil];
    }];
    [self.view addSubview:addFriends];
    
    
    
    
	// Do any additional setup after loading the view.
}

 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150/3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"cell";

    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.imageView.image = [UIImage imageNamed:[_imageArray objectAtIndex:indexPath.row]];
//cell.backgroundView
    UIView* back = [[UIView alloc] init];
    back.backgroundColor = [UIColor underPageBackgroundColor];
    cell.backgroundView = back;
    return cell;
 
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0) {// 易信
        CenterViewController* center  = [[CenterViewController alloc] init];
        UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:center];
        [[self mm_drawerController] setCenterViewController:nav withCloseAnimation:YES completion:nil];
    }
    if (indexPath.row==1) {// 朋友圈
        FriendsCircleViewController* add = [[FriendsCircleViewController alloc] init];
        UINavigationController * friendCircle = [[UINavigationController alloc] initWithRootViewController:add];
        [[self mm_drawerController] setCenterViewController:friendCircle withCloseAnimation:YES completion:nil];
    }
    if (indexPath.row ==2) {// 设置
        SettingViewController* set = [[SettingViewController alloc] init];
        UINavigationController* navSet = [[UINavigationController alloc] initWithRootViewController:set];
        [[self mm_drawerController] setCenterViewController:navSet withCloseAnimation:YES completion:nil];
    }
    
    
    
    
}

-(MMDrawerController*)mm_drawerController{
    if([self.parentViewController isKindOfClass:[MMDrawerController class]]){
        return (MMDrawerController*)self.parentViewController;
    }
    else if([self.parentViewController isKindOfClass:[UINavigationController class]] &&
            [self.parentViewController.parentViewController isKindOfClass:[MMDrawerController class]]){
        return (MMDrawerController*)[self.parentViewController parentViewController];
    }
    else{
        return nil;
    }
}
@end
