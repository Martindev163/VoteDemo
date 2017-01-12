//
//  VoteViewController.h
//  VoteDemo
//
//  Created by 马浩哲 on 17/1/10.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    SingleSelectType,
    MultiSelectType,
} SelectType;

typedef void(^ViewHeightBlock) (CGFloat ViewHeight);

@interface VoteView : UIView

-(void)loadVoteTableViewWithVotesArray:(NSArray *)votes type:(SelectType)type viewHeight:(ViewHeightBlock)block;

@end
