//
//  NSString+AttributedText.m
//  B2B2C
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NSString+AttributedText.h"

@implementation NSString (AttributedText)

-(CGSize)maxTextSizeWithTextWidth:(float)textWidth textFont:(CGFloat)textFont
{
    CGSize constrainedSize = CGSizeMake(textWidth, MAXFLOAT);
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaNeue" size:textFont], NSFontAttributeName,nil];
    CGRect rect = [self boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    if (rect.size.width > textWidth)
    {
        rect = CGRectMake(0, 0, textWidth, rect.size.height);
    }
    return rect.size;
}

-(CGSize)maxTextSizeWithTextHeight:(float)textHeight textFont:(CGFloat)textFont
{
    CGSize constraninedSize = CGSizeMake(MAXFLOAT, textHeight);
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaNeue" size:textFont], NSFontAttributeName, nil];
    CGRect rect = [self boundingRectWithSize:constraninedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    CGRect frame = rect;
    frame.size.width +=20;
    rect = frame;
    
    if (rect.size.height > textHeight)
    {
        rect = CGRectMake(0, 0, rect.size.width, textHeight);
    }
    return rect.size;
}

@end
