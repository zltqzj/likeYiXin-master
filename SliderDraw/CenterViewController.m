//
//  CenterViewController.m
//  SliderDraw
//
//  Created by Sinosoft on 9/9/13.
//  Copyright (c) 2013 com.Sinosoft. All rights reserved.
//

#import "CenterViewController.h"
 
#import "MMExampleDrawerVisualStateManager.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "VoiceViewController.h"
#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, MMCenterViewControllerSection){
    MMCenterViewControllerSectionLeftViewState,
    MMCenterViewControllerSectionLeftDrawerAnimation,
    MMCenterViewControllerSectionRightViewState,
    MMCenterViewControllerSectionRightDrawerAnimation,
};
@interface CenterViewController ()
 

@property (nonatomic,assign) CGRect openFrame;
@property (nonatomic,assign) CGRect closeFrame;
@property (nonatomic,assign) CGRect openFrameBottom;
@property (nonatomic,assign) CGRect closeFrameBottom;
@end

#define OFFSET 150

@implementation CenterViewController
@synthesize chatTable = _chatTable;
@synthesize fakeArray = _fakeArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)baseSetting
{
    self.title = @"易信";
    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer * twoFingerDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerDoubleTap:)];
    [twoFingerDoubleTap setNumberOfTapsRequired:2];
    [twoFingerDoubleTap setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:twoFingerDoubleTap];
    
    [self setupLeftMenuButton];
    [self setupRightMenuButton];
    
    [self.navigationController.navigationBar setTintColor:[UIColor
                                                           colorWithRed:78.0/255.0
                                                           green:156.0/255.0
                                                           blue:206.0/255.0
                                                           alpha:1.0]];

    [self.navigationController.view.layer setCornerRadius:10.0f];
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.openFrame = CGRectMake(5, 0+5, 300, 380); //上
    self.closeFrame = CGRectMake(5, OFFSET+5, 300, 380); //下
    
    self.openFrameBottom = CGRectMake(5, OFFSET+5, 300, 380);
    self.closeFrameBottom = CGRectMake(5, OFFSET*2+5, 300, 380);
}


-(void)tableViewSetting
{
    _chatTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.chatTable.delegate = self;
    self.chatTable.dataSource = self;
    [self.view addSubview:_chatTable];
    
    _fakeArray = [[NSMutableArray alloc]initWithCapacity:10];
    for (int i =0; i<10; i++) {
        [_fakeArray addObject:[NSString stringWithFormat:@"%d  hi",i]];
    }
     
}

 



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self baseSetting];
    [self tableViewSetting];
    
    
    
    
    
    
    
    
	// Do any additional setup after loading the view.
}

-(void)setupLeftMenuButton{
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
}

-(void)setupRightMenuButton{
    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setFrame:CGRectMake(0, 0, 40, 40)];
    [rightBtn setImage:[UIImage imageNamed:@"g_title_team_import_icon.png"] forState:UIControlStateNormal];
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [rightBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
         [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
    }];
    self.navigationItem.rightBarButtonItem = barButton;
}


#pragma mark - Button Handlers
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

-(void)doubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}

-(void)twoFingerDoubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideRight completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma  mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_fakeArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    cell.textLabel.text = [_fakeArray objectAtIndex:indexPath.row];
    //config the cell
    return cell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
     NSLog(@"拖动了几厘米%f",_chatTable.contentOffset.y);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
//    UIEdgeInsets inset = _chatTable.contentInset;
//    inset.top = 65;
//    _chatTable.contentInset = inset;
//    _chatTable.contentOffset = CGPointMake(0, -65);
    if (scrollView.contentOffset.y > -65) {
      
        NSLog(@"go on drag");
    }
    else{
        NSLog(@"enough");
        VoiceViewController* voiceVC = [[VoiceViewController alloc] init];
         
        [voiceVC.view setBackgroundColor:[UIColor grayColor]];
       
        [scrollView setContentOffset:CGPointMake(0, 0)];
       
        CATransition* animation =[CATransition animation];
        [animation setDuration:1.5f];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
        [animation setType:kCATransitionReveal];
        [animation setSubtype:kCATransitionFromBottom];
        [self.view.layer addAnimation:animation forKey:@"Reveal"];
        [self.view addSubview:voiceVC.view];
         
       
         
        
        
        
        
        
        
        
                
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
}













@end
