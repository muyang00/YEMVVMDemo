//
//  SeeBallModel.h
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
#import <Foundation/Foundation.h>

@interface SeeBallModel : NSObject
/*"livecast_id":"134109",
 "Season":"2015",
 "status":"2",
 "Score1":"69",
 "Score2":"75",
 "MatchId":"2015100829",
 "IfHot":"0",
 "LiveMode":"10",
 "Discipline":"basketball",
 "LeagueType":"nba",
 "Round":"Preseason",
 "data_from":"nba",
 "Title":"15/16赛季NBA季前赛 马卡比 69-75 灰熊",
 "date":"2015-10-09",
 "time":"08:00",
 "Team1Id":"nba_0",
 "Team1":"马卡比",
 "Team2Id":"nba_29",
 "Team2":"灰熊",
 "Flag1":"http://www.sinaimg.cn/lf/sports/nba_85/0.png",
 "Flag2":"http://www.sinaimg.cn/lf/sports/nba_85/29.png",
 "Flag1_small":"http://www.sinaimg.cn/lf/sports/nba_85/0.png",
 "Flag2_small":"http://www.sinaimg.cn/lf/sports/nba_85/29.png",
 "Dress1":"",
 "Dress2":"",
 "NewsUrl":"",
 "VideoUrl":"",
 "LiveUrl":"http://sports.sina.com.cn/nba/live.html?id=2015100829",
 "VideoLiveUrl":"",
 "LiveStatusExtra":"",
 "VideoBeginTime":"",
 "odds_url":"",
 "Liver":"",
 "ImgUrl":"",
 "OptaId":"",
 "match_url":"http://sports.sina.com.cn/nba/",
 "MatchCity":"",
 "Situation":"",
 "group":"",
 "narrator":"",
 "Url1":"",
 "Url2":"http://nba.sports.sina.com.cn/team.php?id=29",
 "Television":"",
 "ShortTitle":"NBA",
 "preview_url":"",
 "promo_teamid":"",
 "LeagueType_cn":"NBA",
 "Discipline_cn":"篮球",
 "comment_id":"live_nba_2015100829",
 "odds_id":"",
 "match_status":"2",
 "status_cn":"赛中",
 "video_live_status":"2",
 "VideoEndTime":"",
 "if_rotate_video":"0",
 "Round_cn":"季前赛",
 "LiveStatusExtra_cn":"",
 "if_more_info":true,
 "m3u8":"",
 "weitv_url":"",
 "android":"",
 "period":"4",
 "period_cn":"第4节",
 "rec_ovx":""*/


@property (nonatomic, retain) NSString *Team1;
@property (nonatomic, retain) NSString *Team2;
@property (nonatomic, retain) NSString *Score1;
@property (nonatomic, retain) NSString *Score2;
@property (nonatomic, retain) NSString *Flag1_small;
@property (nonatomic, retain) NSString *Flag2_small;

//暂不用
@property (nonatomic, retain) NSString *Round_cn;
@property (nonatomic, retain) NSString *time;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *status_cn;


@end
