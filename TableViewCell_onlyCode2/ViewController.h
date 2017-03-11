//
//  ViewController.h
//  TableViewCell_onlyCode2
//
//  Created by pro on 17/3/11.
//  Copyright © 2017年 BigNerdRanch. All rights reserved.
//

#import <UIKit/UIKit.h>
#define imageTag   1
#define nameTag    2
@interface ViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)NSArray *listTeams;

@end

