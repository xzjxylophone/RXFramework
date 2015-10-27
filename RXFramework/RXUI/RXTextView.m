//
//  RXTextView.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/26.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXTextView.h"

@interface RXTextView ()
@property (nonatomic, strong) UILabel *lblPlaceholder;

@end

@implementation RXTextView


- (void)initialize
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshPlaceholder) name:UITextViewTextDidChangeNotification object:self];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initialize];
}

- (void)refreshPlaceholder
{
    if(self.text.length > 0) {
        self.lblPlaceholder.alpha = 0;
    } else {
        self.lblPlaceholder.alpha = 0;
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self refreshPlaceholder];
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.lblPlaceholder.font = self.font;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.lblPlaceholder sizeToFit];
    self.lblPlaceholder.frame = CGRectMake(8, 8, CGRectGetWidth(self.frame) - 16, CGRectGetHeight(self.lblPlaceholder.frame));
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
    if (self.lblPlaceholder == nil) {
        self.lblPlaceholder = [[UILabel alloc] init];
        self.lblPlaceholder.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
        self.lblPlaceholder.lineBreakMode = NSLineBreakByWordWrapping;
        self.lblPlaceholder.numberOfLines = 0;
        self.lblPlaceholder.font = self.font;
        self.lblPlaceholder.backgroundColor = [UIColor clearColor];
        self.lblPlaceholder.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        self.lblPlaceholder.alpha = 0;
        [self addSubview:self.lblPlaceholder];
    }
    self.lblPlaceholder.text = self.placeholder;
    [self refreshPlaceholder];
}

//When any text changes on textField, the delegate getter is called. At this time we refresh the textView's placeholder
- (id<UITextViewDelegate>)delegate
{
    [self refreshPlaceholder];
    return [super delegate];
}


@end
