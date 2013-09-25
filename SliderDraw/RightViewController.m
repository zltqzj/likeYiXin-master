//
//  RightViewController.m
//  SliderDraw
//
//  Created by Sinosoft on 9/9/13.
//  Copyright (c) 2013 com.Sinosoft. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController
@synthesize searchBar = _searchBar;
@synthesize mytable = _mytable;
@synthesize displayController = _displayController;
@synthesize fakeArray = _fakeArray;

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
     [self.view setBackgroundColor:[UIColor whiteColor]];
    _mytable = [[UITableView alloc] initWithFrame:CGRectMake(0, 45, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    _mytable.delegate = self;
    _mytable.dataSource = self;
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 3200, 44)];
    [self.view addSubview:_searchBar];
  //  [_mytable setTableHeaderView:_searchBar];
    _searchBar.delegate = self;
    _searchBar.placeholder = @"搜索联系人";
    _displayController  = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    _displayController.delegate = self;
    _displayController.searchResultsDataSource = self;
    _displayController.searchResultsDelegate = self;
    
    [self.view addSubview:_mytable];
    
    _fakeArray = [[NSMutableArray alloc] initWithObjects:@"爸爸",@"妈妈",@"哥哥",@"弟弟",@"妹妹",@"老师", nil];
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISearchBarDelegate
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%s",__FUNCTION__);
      [self.mm_drawerController setMaximumRightDrawerWidth:280];
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    NSLog(@"开始搜索");
    [self.mm_drawerController setMaximumRightDrawerWidth:320];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
  
}

#pragma mark - UISearchDisplayDelegate
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption{
    
    
    return YES;
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

@end
