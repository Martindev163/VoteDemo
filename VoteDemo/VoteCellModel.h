//
//  VoteCellModel.h
//  VoteDemo
//
//  Created by 马浩哲 on 17/1/10.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VoteCellModel : NSObject

@property (nonatomic, strong) NSString *voteStr;

@property (nonatomic, strong) NSString *progressScale;
@property (nonatomic, strong) NSString *progressNum;

-(instancetype)loadModelWithDic:(NSDictionary *)dic;

@end
