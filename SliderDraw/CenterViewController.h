//
//  CenterViewController.h
//  SliderDraw
//
//  Created by Sinosoft on 9/9/13.
//  Copyright (c) 2013 com.Sinosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockUI.h"

@interface CenterViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic) UITableView* chatTable;

@property(strong,nonatomic) NSMutableArray* fakeArray;

@end
