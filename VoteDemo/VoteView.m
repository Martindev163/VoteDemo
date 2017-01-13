//
//  VoteViewController.m
//  VoteDemo
//
//  Created by 马浩哲 on 17/1/10.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "VoteView.h"
#import "Defines.h"
#import "VoteCellModel.h"
#import "VoteTableViewCell.h"
#import "NSString+AttributedText.h"
#define TableHeadViewHeight 30
#define TableFootViewHeight 60

@interface VoteView ()<UITableViewDelegate,UITableViewDataSource,VoteCellDelegate>

@property (nonatomic, strong) NSArray *voteArr;//保存选项的数组

@property (nonatomic, strong) UITableView *tableView;//表。。。

@property (nonatomic, strong) NSMutableArray *heightsArr;//保存cell高度的数组

@property (nonatomic, strong) NSMutableArray *selectedCellArr;//保存被选中的选项

@property (nonatomic, assign) BOOL isSubmit;//是否是提交状态

@property (nonatomic, assign) CGFloat maxHeight;//视图最大高度

@property (nonatomic, strong) UIButton *submitBtn;//提交投票按钮

@property (nonatomic, copy) ViewHeightBlock heightBlock;//改变视图大小用的

@property (nonatomic, assign) SelectType voteType;
@end

@implementation VoteView



-(void)loadVoteTableViewWithVotesArray:(NSArray *)votes type:(SelectType)type viewHeight:(ViewHeightBlock)block
{
    _voteType = type;
    _voteArr = nil;
    if (votes) {
        _voteArr = [[NSArray alloc] initWithArray:votes];
    }
    self.heightBlock = block;
    CGFloat tableViewHeight = [self getTableViewContentHeightWithVotes:_voteArr];
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, tableViewHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //    _tableView.scrollEnabled = NO;
        _tableView.tableHeaderView = [self loadTableViewHeadViewWithType:MultiSelectType];
        _tableView.tableFooterView = [self loadTableViewFootView];
        [self addSubview:_tableView];
    }
    block(tableViewHeight);
    
//    UIView *bootomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_tableView.frame), SCREEN_WIDTH, 10)];
//    bootomView.backgroundColor = [UIColor blueColor];
//    [self addSubview:bootomView];
}

-(NSMutableArray *)selectedCellArr
{
    if (!_selectedCellArr) {
        _selectedCellArr = [[NSMutableArray alloc] init];
    }
    return _selectedCellArr;
}


//计算tableView的ContentView的高度
-(CGFloat)getTableViewContentHeightWithVotes:(NSArray *)votes
{
    _heightsArr = [NSMutableArray new];
    _maxHeight = 0.0;
    for (VoteCellModel *model in votes)
    {
        CGFloat stringheight;
        _maxHeight += 10;
        if (_isSubmit == YES) {
            stringheight = [model.voteStr maxTextSizeWithTextWidth:VoteCellTextLabWidthPro textFont:15].height;
        }
        else
        {
            stringheight = [model.voteStr maxTextSizeWithTextWidth:VoteCellTextLabWidth textFont:15].height;
        }
        
        _maxHeight += stringheight;
        if (_isSubmit == YES) {
            stringheight += 25;
            _maxHeight += 25;
        }
        [_heightsArr addObject:[NSNumber numberWithFloat:stringheight +10]];
    }
    _maxHeight += TableHeadViewHeight;
    _maxHeight += TableFootViewHeight;
    return _maxHeight;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _voteArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellId";
    
    VoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[VoteTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    VoteCellModel *model = _voteArr[indexPath.row];
    [cell setSubViewsWithVoteModel:model cellIndex:indexPath.row cellHight:[_heightsArr[indexPath.row] floatValue] isSubmit:_isSubmit];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = [[_heightsArr objectAtIndex:indexPath.row] floatValue];
    return height;
}

//表头表尾
-(UIView *)loadTableViewHeadViewWithType:(SelectType)type
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TableHeadViewHeight)];
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 20, TableHeadViewHeight)];
    bgView.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    [headView addSubview:bgView];
    NSString *titleStr = [NSString new];
    switch (type) {
        case SingleSelectType:
        {
            titleStr = @"单选投票（最多可选1项）";
        }
            break;
        case MultiSelectType:
        {
            titleStr = @"多选投票（最多可选20项）";
        }
            break;
            
        default:
            break;
    }
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, SCREEN_WIDTH - 30, TableHeadViewHeight)];
    titleLab.text = titleStr;
    titleLab.font = [UIFont systemFontOfSize:14];
    [bgView addSubview:titleLab];
    
    return headView;
}

-(UIView *)loadTableViewFootView
{
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TableFootViewHeight)];
    
    _submitBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 40)];
    _submitBtn.backgroundColor = [UIColor redColor];
    [_submitBtn setTitle:@"确认投票" forState:UIControlStateNormal];
    [_submitBtn addTarget:self action:@selector(tapSubmitBtnAction) forControlEvents:UIControlEventTouchUpInside];
    _submitBtn.layer.cornerRadius = 3;
    _submitBtn.layer.masksToBounds = YES;
    [footView addSubview:_submitBtn];
    return footView;
}

//记录选中取消选中了那些选项
-(void)selectChackBtnWithCellIndex:(NSInteger)index
{
    BOOL isHas = NO;
    
    for (NSNumber *num in self.selectedCellArr)
    {
        if (num.integerValue == index)
        {
            isHas = YES;
        }
    }
    if (isHas == NO)
    {
        [self.selectedCellArr addObject:[NSNumber numberWithInteger:index]];
    }
}

//点击确认投票
-(void)tapSubmitBtnAction
{
    if (_isSubmit == NO) {
        _isSubmit = YES;
        [self getTableViewContentHeightWithVotes:_voteArr];
        CGRect tempFrame = self.tableView.frame;
        tempFrame.size.height = _maxHeight;
        self.tableView.frame = tempFrame;
        [self.tableView reloadData];
        
        _submitBtn.backgroundColor = [UIColor lightGrayColor];
        [_submitBtn setTitle:@"已投票" forState:UIControlStateNormal];
        
        _heightBlock(_maxHeight);
        
        if ([self.delegate respondsToSelector:@selector(changeHeightChangeUIMethod)])
        {
            [self.delegate changeHeightChangeUIMethod];
        }
    }
}

-(void)deSelectChackBtnWithCellIndex:(NSInteger)index
{
    BOOL isHas = NO;
    
    for (NSNumber *num in self.selectedCellArr)
    {
        if (num.integerValue == index)
        {
            isHas = YES;
        }
    }
    if (isHas == YES)
    {
        [self.selectedCellArr removeObject:[NSNumber numberWithInteger:index]];
    }
}


@end
