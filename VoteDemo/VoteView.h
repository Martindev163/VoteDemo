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

@protocol VoteViewDelegate <NSObject>

-(void)changeHeightChangeUIMethod;

@end

@interface VoteView : UIView

@property (nonatomic, weak) id<VoteViewDelegate> delegate;

-(void)loadVoteTableViewWithVotesArray:(NSArray *)votes type:(SelectType)type viewHeight:(ViewHeightBlock)block;

@end
