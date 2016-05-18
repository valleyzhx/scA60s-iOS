//
//  ViewController.m
//  ScaApp
//
//  Created by Xiang on 16/5/15.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "ViewController.h"
#import "ListenModel.h"
#import <MJRefresh.h>
#import "PlayerViewController.h"
#import "DreamPlayer.h"
#import "BaseViewController+NaviView.h"

@interface ViewController ()

@end

@implementation ViewController{
    int _page;
    NSMutableArray *_dataArr;
    DreamPlayer *_dreamPlayer;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    view.backgroundColor = viewBGColor;
    self.tableView.tableHeaderView = view;
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadListenData)];
    header.backgroundColor = Nav_Color;
    header.lastUpdatedTimeLabel.textColor = header.stateLabel.textColor = [UIColor whiteColor];
    header.lastUpdatedTimeLabel.font = header.stateLabel.font = [UIFont systemFontOfSize:12];
    self.tableView.mj_header = header;
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadData)];


    _dataArr = [NSMutableArray array];
    _page = 1;
    [self loadData];
    _dreamPlayer = [[DreamPlayer alloc]init];
    _naviBar = [self setUpNaviViewWithType:GGNavigationBarTypeCustom];
}


-(void)loadData{
    __weak typeof(self) weakSelf = self;
    [ListenModel getModelArrWithPage:_page success:^(id result) {
        NSArray *arr = result;
        if (arr.count) {
            [_dataArr addObjectsFromArray:arr];
            _page++;
            [weakSelf.tableView.mj_footer endRefreshing];
            [weakSelf.tableView reloadData];
        }else{
            [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        [weakSelf.tableView.mj_header endRefreshing];
    }];
}

-(void)reloadListenData{
    [_dataArr removeAllObjects];
    _page = 1;
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UILabel *titleLab = [cell.contentView viewWithTag:10];
    UILabel *dateLab = [cell.contentView viewWithTag:11];

    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        titleLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-20, 40)];
        titleLab.textColor = TextDarkColor;
        titleLab.font = [UIFont systemFontOfSize:14];
        titleLab.numberOfLines = 2;
        titleLab.tag = 10;
        [cell.contentView addSubview:titleLab];
        
        dateLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 120, 20)];
        dateLab.textColor = JDDarkOrange;
        dateLab.font = [UIFont systemFontOfSize:14];
        dateLab.tag = 11;
        [cell.contentView addSubview:dateLab];
        
    }
    ListenModel *model = _dataArr[indexPath.row];
    titleLab.text = model.title;
    dateLab.text = model.create;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PlayerViewController *vc = [[PlayerViewController alloc]init];
    vc.model = _dataArr[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    vc.dreamPlayer = _dreamPlayer;
    NSURL *URL = [NSURL URLWithString:vc.model.mp3];
    if (![_dreamPlayer.currentName isEqualToString:URL.lastPathComponent]) {
        [_dreamPlayer playAudio:URL];
    }
}

@end
