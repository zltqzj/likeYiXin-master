//
//  RightViewController.h
//  SliderDraw
//
//  Created by Sinosoft on 9/9/13.
//  Copyright (c) 2013 com.Sinosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlockUI.h"
#import "UIViewController+MMDrawerController.h"
@interface RightViewController : UIViewController <UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic) UISearchBar* searchBar;

@property(strong,nonatomic) UITableView* mytable;

@property(strong,nonatomic) UISearchDisplayController* displayController;

@property(strong,nonatomic) NSMutableArray* fakeArray;

@end
