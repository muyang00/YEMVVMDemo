//
//  SeeBallViewModel.m
//  MVVM--Demo
//
//  Created by Apple on 16/6/21.
//  Copyright © 2016年 杨永恩. All rights reserved.
//

#import "SeeBallViewModel.h"
#import "SeeBallCell.h"
#import "NetAPIClient.h"
#import "SeeBallModel.h"

@interface SeeBallViewModel ()

@end
@implementation SeeBallViewModel



- (void)getSeeBallCompleteSuccess:(void (^)(id data))success failure:(void(^)(NSError *error))failure{
    
  NSString *path = @"app_key=2586208540&_version__=3.1.3.02&__os__=android&_sport_t_=livecast&show_extra=1&f=livecast_id,LeagueType,status,Team1Id,Team2Id,Score1,Score2,MatchId,LiveMode,Discipline,data_from,Title,date,time,Team1,Team2,Flag1,Flag2,NewsUrl,VideoUrl,LiveUrl,LiveStatusExtra,VideoLiveUrl,VideoBeginTime,narrator,LeagueType_cn,Discipline_cn,comment_id,odds_id,VideoEndTime,if_rotate_video,LiveStatusExtra_cn,m3u8,android,period_cn,program,penalty1,media_tag,penalty1,Round_cn,extra,rec_ovx,VideoId&_sport_a_=typeMatches&l_type=nba";
    
    [[NetAPIClient sharedJsonClient] requestJsonDataWithPath:path withParams:nil withMethodType:Get autoShowError:NO andBlock:^(NSDictionary *valueDic, NSError *error){
        
        if (valueDic) {
            NSMutableArray *dataSourceMutableArray = [NSMutableArray array];
            
            for (NSDictionary *dic in valueDic[@"result"][@"data"][@"full"]) {
                
                SeeBallModel *model = [[SeeBallModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                [dataSourceMutableArray addObject:model];
            }
            for (NSDictionary *dic in valueDic[@"result"][@"data"][@"cur"]) {
                
                SeeBallModel *model = [[SeeBallModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                [dataSourceMutableArray addObject:model];
            }
            for (NSDictionary *dic in valueDic[@"result"][@"data"][@"pre"]) {
                
                SeeBallModel *model = [[SeeBallModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                [dataSourceMutableArray addObject:model];
            }
            
            
            success(dataSourceMutableArray);
            
            
             XBWLog(@"-------success");
        }else{
            
            failure(error);
            
            XBWLog(@"---------failure");
        }
        
    }];
    
}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return self.allDataMutableArray.count;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//        static NSString *identifierCell = @"cell";
//        SeeBallCell *Cell = [tableView dequeueReusableCellWithIdentifier:identifierCell];
//        if (Cell) {
//            Cell = [[SeeBallCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierCell];
//        }
    
    SeeBallCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    SeeBallModel *model = self.allDataMutableArray[indexPath.row];
    
    [Cell setValueWithModel:model];
    
    return Cell;
    
}











@end
