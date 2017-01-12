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

@interface ViewController ()

@property (nonatomic, strong) NSArray *voteArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    VoteView *voteV = [[VoteView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    [voteV loadVoteTableViewWithVotesArray:self.voteArr type:SingleSelectType viewHeight:^(CGFloat ViewHeight) {
        CGRect tempFrame = voteV.frame;
        tempFrame.size.height = ViewHeight;
        voteV.frame = tempFrame;
    }];
    
    [self.view addSubview:voteV];
    
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
