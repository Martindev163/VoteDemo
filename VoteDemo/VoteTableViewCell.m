//
//  VoteTableViewCell.m
//  VoteDemo
//
//  Created by 马浩哲 on 17/1/10.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "VoteTableViewCell.h"
#import "NSString+AttributedText.h"
#import "Defines.h"

#define ProgressViewWidth (SCREEN_WIDTH - 110)
#define ProgressViewHeight 10
@interface VoteTableViewCell ()

@property (nonatomic, strong) UILabel *textLab;

@property (nonatomic, strong) UIButton *chackBtn;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, assign) NSInteger cellIndex;

@property (nonatomic, strong) UIView *progressView;//进度条

@property (nonatomic, strong) UIView *progressBgView;//进度条背景

@property (nonatomic, strong) UILabel *progressLab;//进度展示

@property (nonatomic, assign) BOOL isSubmit;


@end

@implementation VoteTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self loadSubViews];
    }
    return self;
}

-(void)loadSubViews
{
    _textLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, VoteCellTextLabWidth, 0)];
    _textLab.font = [UIFont systemFontOfSize:14];
    _textLab.numberOfLines = 0;
//    _textLab.backgroundColor = [UIColor redColor];
    [self addSubview:_textLab];
    
    _chackBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_textLab.frame), 0, 50, 0)];
    [_chackBtn setImage:[UIImage imageNamed:@"sortDeselect"] forState:UIControlStateNormal];
    [_chackBtn addTarget:self action:@selector(tapCheckBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_chackBtn];
    
    _progressView = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_textLab.frame), ProgressViewWidth/3, ProgressViewHeight)];
    _progressView.backgroundColor = [UIColor redColor];
    _progressView.layer.cornerRadius = ProgressViewHeight/2;
    _progressView.layer.masksToBounds = YES;
    
    _progressBgView = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_textLab.frame), ProgressViewWidth, ProgressViewHeight)];
    _progressBgView.backgroundColor = [UIColor lightGrayColor];
    _progressBgView.layer.cornerRadius = ProgressViewHeight/2;
    _progressBgView.layer.masksToBounds = YES;
    
    _progressView.hidden = YES;
    _progressBgView.hidden = YES;
    [self addSubview:_progressBgView];
    [self addSubview:_progressView];
    
    //进度
    _progressLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_progressBgView.frame)+10, 0, 100, 15)];
    _progressLab.font = [UIFont systemFontOfSize:14];
    _progressLab.hidden = YES;
    [self addSubview:_progressLab];
    
    _lineView = [UIView new];
    _lineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_lineView];
}

-(void)setSubViewsWithVoteModel:(VoteCellModel *)model cellIndex:(NSInteger)index cellHight:(CGFloat)height isSubmit:(BOOL)confirm
{
    self.cellIndex = index;
    
    self.isSubmit = confirm;
    
    CGFloat textLabHeight;
    
    if (_isSubmit == YES) {
        textLabHeight = [model.voteStr maxTextSizeWithTextWidth:VoteCellTextLabWidthPro textFont:15].height;
    }
    else
    {
        textLabHeight = [model.voteStr maxTextSizeWithTextWidth:VoteCellTextLabWidth textFont:15].height;
    }
    
    CGRect tempFrame = _textLab.frame;
    tempFrame.size.height = textLabHeight;
    _textLab.frame = tempFrame;
    _textLab.text = model.voteStr;
    
    CGRect btnTempFrame = _chackBtn.frame;
    btnTempFrame.size.height = textLabHeight + 10;
    _chackBtn.frame = btnTempFrame;
    
    if (confirm)
    {
        _chackBtn.hidden = YES;
        CGRect tempFrame = _textLab.frame;
        tempFrame.size.height = textLabHeight;
        tempFrame.size.width = VoteCellTextLabWidthPro;
        _textLab.frame = tempFrame;
        _textLab.text = model.voteStr;
        
        _progressBgView.hidden = NO;
        _progressView.hidden = NO;
        _progressLab.hidden = NO;
        
        CGRect proTempFrame = _progressView.frame;
        proTempFrame.origin.y = height - 20;
        proTempFrame.size.width = ProgressViewWidth*(model.progressScale.floatValue/100.0);
        CGRect proBgTempFrame = _progressBgView.frame;
        proBgTempFrame.origin.y = height - 20;
        _progressView.frame = proTempFrame;
        _progressBgView.frame = proBgTempFrame;
        
        CGRect LabtempFrame = _progressLab.frame;
        LabtempFrame.origin.y = CGRectGetMaxY(_textLab.frame)+5;
        _progressLab.frame = LabtempFrame;
        _progressLab.text = [NSString stringWithFormat:@"%@(%@%%)",model.progressNum,model.progressScale];
    }
    
    _lineView.frame = CGRectMake(0, height-0.5, SCREEN_WIDTH, 0.5);
    
//    self.backgroundColor = [UIColor colorWithRed:random()%255/255.0 green:random()%255/255.0 blue:random()%255/255.0 alpha:1.0];
}

//点击选项按钮
-(void)tapCheckBtn:(UIButton *)sender
{  
    if ([self.delegate respondsToSelector:@selector(selectChackBtnWithCellIndex:)])
    {
        [self.delegate selectChackBtnWithCellIndex:_cellIndex];
    }
}

-(void)setIsSelect:(BOOL)isSelect
{
    if (isSelect == YES)
    {
        [_chackBtn setImage:[UIImage imageNamed:@"sortSelect"] forState:UIControlStateNormal];
    }
    else
    {
        [_chackBtn setImage:[UIImage imageNamed:@"sortDeselect"] forState:UIControlStateNormal];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
