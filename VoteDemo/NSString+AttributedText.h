//
//  NSString+AttributedText.h
//  B2B2C
//
//  Created by apple on 16/4/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (AttributedText)
/**
 *  根据宽度自定义文本大小
 */
-(CGSize)maxTextSizeWithTextWidth:(float)textWidth textFont:(CGFloat)textFont;
/**
 *  根据高度自定义文本大小
 */
-(CGSize)maxTextSizeWithTextHeight:(float)textHeight textFont:(CGFloat)textFont;
@end
