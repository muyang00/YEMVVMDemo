//
//  SeeBallCell.h
//  MVVM--Demo
//
//  Created by Apple on 16/6/21.
//  Copyright © 2016年 杨永恩. All rights reserved.
//

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
