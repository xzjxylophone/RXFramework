//
//  UILabel+RXUtility.m
//  A2A
//
//  Created by Rush.D.Xzj on 15/4/18.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "UILabel+RXUtility.h"

@implementation UILabel (RXUtility)

- (void)rx_setAttributedTextWithStringAry:(NSArray *)stringAry fontAry:(NSArray *)fontAry colorAry:(NSArray *)colorAry
{
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:[stringAry componentsJoinedByString:@""]];
    int startIndex = 0;
    for (int i = 0; i < stringAry.count; i++) {
        NSString *tmp = [stringAry objectAtIndex:i];
        UIColor *textColor = [colorAry objectAtIndex:i];
        UIFont *font = [fontAry objectAtIndex:i];
        if (![textColor isKindOfClass:[NSNull class]]) {
            [attStr addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(startIndex, tmp.length)];
        }
        if (![font isKindOfClass:[NSNull class]]) {
            [attStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(startIndex, tmp.length)];
        }
        startIndex += tmp.length;
    }
    
    self.attributedText = attStr;
}

- (void)rx_setAttributedTextWithStringAry:(NSArray *)stringAry fontAry:(NSArray *)fontAry colorAry:(NSArray *)colorAry underlineAry:(NSArray *)underlineAry
{
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:[stringAry componentsJoinedByString:@""]];
    int startIndex = 0;
    for (int i = 0; i < stringAry.count; i++) {
        NSString *tmp = [stringAry objectAtIndex:i];
        UIColor *textColor = [colorAry objectAtIndex:i];
        UIFont *font = [fontAry objectAtIndex:i];
        NSNumber *underline = [underlineAry objectAtIndex:i];
        NSRange range = NSMakeRange(startIndex, tmp.length);
        if (![textColor isKindOfClass:[NSNull class]]) {
            [attStr addAttribute:NSForegroundColorAttributeName value:textColor range:range];
        }
        if (![font isKindOfClass:[NSNull class]]) {
            [attStr addAttribute:NSFontAttributeName value:font range:range];
        }
        if (![underline isKindOfClass:[NSNull class]]) {
            [attStr addAttribute:NSUnderlineStyleAttributeName value:underline range:range];
        }
        startIndex += tmp.length;
    }
    
    self.attributedText = attStr;
}

-(void)rx_alignTop {
    CGSize fontSize =[self.text sizeWithFont:self.font];
    double finalHeight = fontSize.height *self.numberOfLines;
    double finalWidth =self.frame.size.width;//expected width of label
    CGSize theStringSize =[self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
    int newLinesToPad =(fontSize.height - theStringSize.height)/ fontSize.height;
    if (newLinesToPad == 0) {
        self.text =[self.text stringByAppendingString:@"\n "];

    }
//    for(int i=0; i<newLinesToPad; i++)
//        self.text =[self.text stringByAppendingString:@"\n "];
}

-(void)rx_alignBottom {
    CGSize fontSize =[self.text sizeWithFont:self.font];
    double finalHeight = fontSize.height *self.numberOfLines;
    double finalWidth =self.frame.size.width;//expected width of label
    CGSize theStringSize =[self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
    int newLinesToPad =(finalHeight - theStringSize.height)/ fontSize.height;
    for(int i=0; i<newLinesToPad; i++)
        self.text =[NSString stringWithFormat:@" \n%@",self.text];
}


@end
