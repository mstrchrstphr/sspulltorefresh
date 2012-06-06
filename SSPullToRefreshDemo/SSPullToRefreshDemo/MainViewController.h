//
//  MainViewController.h
//  SSPullToRefreshDemo
//
//  Created by Christopher Constable on 6/6/12.
//

#import "SSPullToRefresh.h"

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, SSPullToRefreshViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SSPullToRefreshView *pullToRefreshContainer;

@end
