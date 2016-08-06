//
//  ViewController.m
//  moreCanSelect
//
//  Created by  张亚飞 on 16/7/15.
//  Copyright © 2016年  张亚飞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
    [self startView];
}
- (void)startView {
    self.dataArray = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    self.deleteDic = [[NSMutableDictionary alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.editBtn.title = @"编辑";
    
    self.allselect.enabled = NO;
    self.allselect.title = @"";
}

#pragma mark -IBAction-

- (IBAction)editData:(id)sender {
    if ([_editBtn.title isEqualToString:@"编辑"]) {
        _editBtn.title = @"确定";
        [self.tableView setEditing:YES animated:YES];
        self.allselect.enabled = YES;
        self.allselect.title = @"全选";
    } else {
        _editBtn.title = @"编辑";
        [_deleteDic removeAllObjects];
        [self.tableView setEditing:NO animated:YES];
        self.allselect.enabled = NO;
        self.allselect.title = @"";
    }
}

- (IBAction)deleteAction:(id)sender {
    [_dataArray removeObjectsInArray:[_deleteDic allKeys]];
    
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithArray:[_deleteDic allValues]] withRowAnimation:UITableViewRowAnimationFade];
    [_deleteDic removeAllObjects];
}

- (IBAction)allselect:(id)sender {
    for (int row=0; row<_dataArray.count; row++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
        [_tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        [_deleteDic setObject:indexPath forKey:[_dataArray objectAtIndex:indexPath.row]];
    }
}


#pragma mark Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
   
    
    // Configure the cell...
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}


#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中");
    if ([_editBtn.title isEqualToString:@"确定"]) {
        [_deleteDic setObject:indexPath forKey:[_dataArray objectAtIndex:indexPath.row]];
        
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_editBtn.title isEqualToString:@"确定"]) {
        [_deleteDic removeObjectForKey:[_dataArray objectAtIndex:indexPath.row]];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
