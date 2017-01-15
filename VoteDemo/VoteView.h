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

-(void)changeHeightChangeUIMethod;//当点击投票改变cell高度，voteView高度随之变化

@end

@interface VoteView : UIView

@property (nonatomic, assign) NSInteger canSelects;//多选情况下可以被选中的个数
@property (nonatomic, weak) id<VoteViewDelegate> delegate;

/*
 * votes : 包含VoteCellModel 的数组，具体的数据类型可以根据后台数据修改，本例本地数据在Votes.plist中。
 * type : 选择投票的方式是单选还是多选
 * block : voteView的当前高度改变时，可以在这里修改VC中的UI
 */
-(void)loadVoteTableViewWithVotesArray:(NSArray *)votes type:(SelectType)type viewHeight:(ViewHeightBlock)block;

@end
