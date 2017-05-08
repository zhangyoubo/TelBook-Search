//
//  ViewController.h
//  TelBook
//
//  Created by Apple on 15/10/9.
//  Copyright (c) 2015年 zf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

@property(retain)NSMutableArray *array;
@property(retain)NSMutableArray *array_cell;
@property(retain)UITableView *table;

@end

