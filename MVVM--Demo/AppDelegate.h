//
//  AppDelegate.h
//  MVVM--Demo
//
//  Created by Apple on 16/6/24.
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
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

