//
//  SeeBallViewController.m
//  MVVM--Demo
//
//  Created by Apple on 16/6/21.
//  Copyright © 2016年 杨永恩. All rights reserved.
//
/**
 
 *******************************************************
 *                                                      *
 * 感谢您的支持， 如果下载的代码在使用过程中出现BUG或者其他问题    *
 * 您可以发邮件到muyang_xl@sina.com 或者 到                    *
 * https://github.com/muyang00?tab=repositories 提交问题   *
 *                                                      *
 *******************************************************
 
 */
#import "SeeBallViewController.h"
#import "SeeBallViewModel.h"
#import "SeeBallModel.h"
#import "SeeBallCell.h"


@interface SeeBallViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SeeBallViewModel *viewModel;
@property (nonatomic, strong) SeeBallModel *model;


@end

@implementation SeeBallViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setupTableViewAndHUD];
    
    [self setupTableViewDatasource];
    
    
}

- (void)setupTableViewAndHUD{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    self.tableView.rowHeight = 140;
    self.tableView.estimatedRowHeight = 140;
    [self.tableView registerClass:[SeeBallCell class] forCellReuseIdentifier:@"cell"];
    self.model = [[SeeBallModel alloc]init];
    self.viewModel = [[SeeBallViewModel alloc]init];
     self.viewModel.allDataMutableArray = @[].mutableCopy;
    
    self.tableView.dataSource = self.viewModel;
    self.tableView.delegate = self.viewModel;
    

    self.tableView.separatorColor = [UIColor orangeColor];
    [self.view addSubview:self.tableView];
    
    

}


- (void)setupTableViewDatasource{
    
    
    __weak typeof(self ) weakSelf = self;

    [self.viewModel getSeeBallCompleteSuccess:^(id  data){
       
        
        [weakSelf.viewModel.allDataMutableArray removeAllObjects];
        [weakSelf.viewModel.allDataMutableArray addObjectsFromArray:data];
        
        [weakSelf.tableView reloadData];
        
        
    }failure:^(NSError *error){
        
        XBWLog(@"%@", error);
        
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 
 
*/

@end
