//
//  LeftViewController.h
//  SliderDraw
//
//  Created by Sinosoft on 9/9/13.
//  Copyright (c) 2013 com.Sinosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockUI.h"
@class CenterViewController;

@interface LeftViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic) UITableView* leftTableView;

@property(strong,nonatomic) NSMutableArray* dataArray;

@property(strong,nonatomic) NSMutableArray* imageArray;

@property(strong,nonatomic) UIButton* btn1;

@end
