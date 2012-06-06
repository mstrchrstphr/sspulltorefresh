//
//  MainViewController.m
//  SSPullToRefreshDemo
//
//  Created by Christopher Constable on 6/6/12.
//

#import "MainViewController.h"

@interface MainViewController ()
- (void)refreshTableView;
@end

@implementation MainViewController

@synthesize tableView = _tableView;
@synthesize pullToRefreshContainer = _pullToRefreshContainer;

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)loadView
{    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.pullToRefreshContainer = [[SSPullToRefreshView alloc] initWithScrollView:self.tableView delegate:self];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.pullToRefreshContainer = nil;
}

- (void)refreshTableView
{
    [self.pullToRefreshContainer startLoading];
    
    // Make new colors! :D
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.pullToRefreshContainer finishLoading];
}

- (void)pullToRefreshViewDidStartLoading:(SSPullToRefreshView *)view
{
    [self refreshTableView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CGRect screenFrame = [[UIScreen mainScreen] applicationFrame];
    return (screenFrame.size.height == 480) ? 7 : 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"resuableCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"resuableCell"];
    }
    
    [[cell textLabel] setText:@"SSPullToRefresh"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor colorWithRed:(((arc4random() % 125) + 130) / 255.0) 
                                             green:(((arc4random() % 125) + 130) / 255.0) 
                                              blue:(((arc4random() % 125) + 130) / 255.0) alpha:1.0]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
