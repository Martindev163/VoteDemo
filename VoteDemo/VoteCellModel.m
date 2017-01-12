//
//  VoteCellModel.m
//  VoteDemo
//
//  Created by 马浩哲 on 17/1/10.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "VoteCellModel.h"

@interface VoteCellModel ()



@end

@implementation VoteCellModel

-(instancetype)loadModelWithDic:(NSDictionary *)dic
{
    if (dic) {
        self.voteStr = [dic objectForKey:@"voteStr"];
        self.progressScale = [dic objectForKey:@"progressScale"];
        self.progressNum = [dic objectForKey:@"progressNum"];
    }
    return self;
}

@end
