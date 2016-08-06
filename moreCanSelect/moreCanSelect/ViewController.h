//
//  ViewController.h
//  moreCanSelect
//
//  Created by  张亚飞 on 16/7/15.
//  Copyright © 2016年  张亚飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIBarButtonItem *deleteBtn;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *editBtn;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *allselect;



@property (nonatomic ,retain) NSMutableArray *dataArray;
@property (nonatomic, retain) NSMutableDictionary *deleteDic;

@end

