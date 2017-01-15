//
//  VoteTableViewCell.h
//  VoteDemo
//
//  Created by 马浩哲 on 17/1/10.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VoteCellModel.h"

#define VoteCellTextLabWidth (SCREEN_WIDTH - 60)
#define VoteCellTextLabWidthPro (SCREEN_WIDTH - 20)

@protocol VoteCellDelegate <NSObject>

-(void)selectChackBtnWithCellIndex:(NSInteger)index;

@end

@interface VoteTableViewCell : UITableViewCell

@property (nonatomic, weak) id<VoteCellDelegate> delegate;

@property (nonatomic, assign) BOOL isSelect;//选项按钮是否

-(void)setSubViewsWithVoteModel:(VoteCellModel *)model cellIndex:(NSInteger)index cellHight:(CGFloat)height isSubmit:(BOOL)confirm;

@end
