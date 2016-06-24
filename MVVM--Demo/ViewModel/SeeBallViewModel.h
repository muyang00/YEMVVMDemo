//
//  SeeBallViewModel.h
//  MVVM--Demo
//
//  Created by Apple on 16/6/21.
//  Copyright © 2016年 杨永恩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SeeBallViewModel : NSObject<UITableViewDelegate, UITableViewDataSource>

- (void)getSeeBallCompleteSuccess:(void (^)(id data))success failure:(void(^)(NSError *error))failure;
@property (nonatomic, retain) NSMutableArray *allDataMutableArray;


@end
