//
//  SeeBallCell.h
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
#import <UIKit/UIKit.h>
#import "SeeBallModel.h"
@interface SeeBallCell : UITableViewCell

@property (strong, nonatomic)  UILabel *teamLabel1;
@property (strong, nonatomic)  UILabel *teamLabel2;
@property (strong, nonatomic)  UILabel *scoreLabel1;
@property (strong, nonatomic)  UILabel *scoreLabel2;
@property (strong, nonatomic)  UIImageView *team1ImageView;
@property (strong, nonatomic)  UIImageView *team2ImageView;


- (void)setValueWithModel:(SeeBallModel *)model;

@end
