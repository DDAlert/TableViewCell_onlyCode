//
//  ViewController.m
//  TableViewCell_onlyCode2
//
//  Created by pro on 17/3/11.
//  Copyright © 2017年 BigNerdRanch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"team" ofType:@"plist"];
    self.listTeams = [[NSArray alloc] initWithContentsOfFile:plistPath];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listTeams count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    //自定义新的Cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //图片
        CGRect imageRect = CGRectMake(15, 5, 60, 50);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:imageRect];
        imageView.tag = imageTag;
        
        //为图片添加边框
        CALayer *layer = [imageView layer];
        layer.cornerRadius = 8;//角的弧度
        layer.borderColor = [[UIColor whiteColor]CGColor];
        layer.masksToBounds  = YES;//图片填充边框
        [cell.contentView addSubview:imageView];
        
        //姓名
        CGRect nameRect = CGRectMake(250, 15, 70, 25);
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:nameRect];
        nameLabel.font = [UIFont boldSystemFontOfSize:15];
        nameLabel.tag = nameTag;
        nameLabel.textColor = [UIColor brownColor];
        [cell.contentView addSubview:nameLabel];
    }
    //获得行数
    NSUInteger row = [indexPath row];
    
    NSDictionary *rowDict = [self.listTeams objectAtIndex:row];
    
    //设置图片
    UIImageView *imageV = (UIImageView *)[cell.contentView viewWithTag:imageTag];
    imageV.image = [UIImage imageNamed:[rowDict objectForKey:@"image"]];
    
    //设置姓名
    UILabel *name = (UILabel *)[cell.contentView viewWithTag:nameTag];
    name.text = [rowDict objectForKey:@"name"];
    
    //设置右侧箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
@end

































