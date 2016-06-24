//
//  SeeBallCell.m
//  MVVM--Demo
//
//  Created by Apple on 16/6/21.
//  Copyright © 2016年 杨永恩. All rights reserved.
//

#import "SeeBallCell.h"


@implementation SeeBallCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      [self configSeeBallCell];
    }
    return  self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configSeeBallCell{
    self.team1ImageView = [[UIImageView alloc]init];
    [self addSubview:self.team1ImageView];
    self.team2ImageView = [[UIImageView alloc]init];
    [self addSubview:self.team2ImageView];
    self.teamLabel1 = [[UILabel alloc]init];
    [self addSubview:self.teamLabel1];
    self.teamLabel2 = [[UILabel alloc]init];
    [self addSubview:self.teamLabel2];
    self.scoreLabel1 = [[UILabel alloc]init];
     [self addSubview:self.scoreLabel1];
    self.scoreLabel2 = [[UILabel alloc]init];
     [self addSubview:self.scoreLabel2];
    

    [self MVVMlayoutSubviews];
}


- (void)MVVMlayoutSubviews{
    
    [self.team1ImageView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.top.mas_equalTo(10);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    [self.team2ImageView mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.team1ImageView.mas_bottom).offset(10);
        make.width.mas_equalTo(self.team1ImageView);
        make.height.mas_equalTo(50);
    }];
    
    [self.teamLabel1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(20);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(30);
        make.left.equalTo(self.team1ImageView.mas_right).offset(50);
        
    }];
    [self.teamLabel2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.mas_equalTo(self.teamLabel1.mas_bottom).offset(30);
        make.width.mas_equalTo(self.teamLabel1);
        make.height.equalTo(self.teamLabel1);
        make.left.mas_equalTo(self.team2ImageView.mas_right).offset(50);
    }];
    
    [self.scoreLabel1 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(50);
    }];
    [self.scoreLabel2 mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.scoreLabel1.mas_bottom).offset(20);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(self.scoreLabel1);
        
    }];
    
  
    
}



- (void)setValueWithModel:(SeeBallModel *)model{
    
    self.teamLabel1.text = model.Team1;
    self.teamLabel2.text = model.Team2;
    self.scoreLabel1.text = model.Score1;
    self.scoreLabel2.text = model.Score2;
    [self.team1ImageView sd_setImageWithURL:[NSURL URLWithString:model.Flag1_small]];
    [self.team2ImageView sd_setImageWithURL:[NSURL URLWithString:model.Flag2_small]];

   
    
}


@end
