//
//  ViewController.m
//  VoteDemo
//
//  Created by 马浩哲 on 17/1/9.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "ViewController.h"
#import "VoteCellModel.h"
#import "VoteView.h"
#import "Defines.h"

@interface ViewController ()<VoteViewDelegate>

@property (nonatomic, strong) NSArray *voteArr;

//@property (nonatomic, strong) UIView *testView;
@property (nonatomic, strong) VoteView *voteView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _voteView = [[VoteView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _voteView.delegate = self;
    [_voteView loadVoteTableViewWithVotesArray:self.voteArr type:SingleSelectType viewHeight:^(CGFloat ViewHeight) {
        CGRect tempFrame = _voteView.frame;
        tempFrame.size.height = ViewHeight;
        _voteView.frame = tempFrame;
    }];
    _height.constant = _voteView.frame.size.height;
    [self.view setNeedsLayout];
    [self.topView addSubview:_voteView];
    
    /*
     _testView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_voteView.frame), SCREEN_WIDTH, 10)];
     _testView.backgroundColor = [UIColor redColor];
     [self.view addSubview:_testView];
     */
    
}

-(void)changeHeightChangeUIMethod
{
    /*代码实现view和其他空间的间距
     CGRect tempRect = _testView.frame;
     tempRect.origin.y = CGRectGetMaxY(_voteView.frame);
     _testView.frame = tempRect;
     */
    _height.constant = _voteView.frame.size.height;
    [self.view setNeedsLayout];
}

-(NSArray *)voteArr
{
    if (!_voteArr) {
        
        NSDictionary *voteDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Votes" ofType:@"plist"]];
        NSMutableArray *tempArr = [NSMutableArray new];
        for (NSDictionary *dic in [voteDic objectForKey:@"data"])
        {
            VoteCellModel *model = [[VoteCellModel alloc] init];
            [tempArr addObject:[model loadModelWithDic:dic]];
        }
        _voteArr = [NSArray arrayWithArray:tempArr];
    }
    return _voteArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
