//
//  RXUtils.m
//  Shangqian
//
//  Created by Rush.D.Xzj on 14-10-7.
//  Copyright (c) 2014年 Wanda Inc. All rights reserved.
//

#import "RXUtils.h"

@implementation RXUtils


+ (UIBarButtonItem *)rxBarButtonItemWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName
{
    NSString *highlightedImageName = [NSString stringWithFormat:@"%@_h", imageName];
    return [self rxBarButtonItemWithTarget:target action:action imageName:imageName highlightedImageName:highlightedImageName];
}
+ (UIBarButtonItem *)rxBarButtonItemWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName
{
    UIButton *btn = [self buttonWithTarget:target action:action imageName:imageName highlightedImageName:highlightedImageName];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


+ (UIBarButtonItem *)rxBarButtonItemWithTarget:(id)target action:(SEL)action title:(NSString *)title backgroundImageName:(NSString *)backgroundImageName
{
    UIFont *font = [UIFont boldSystemFontOfSize:17];
    UIImage *image = [UIImage imageNamed:backgroundImageName];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 7, image.size.width, image.size.height);
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.titleLabel.textColor = [UIColor whiteColor];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)rxBarButtonItemWithTarget:(id)target action:(SEL)action title:(NSString *)title
{
    UIFont *font = [UIFont boldSystemFontOfSize:17];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
//    NSDictionary *dic = @{NSFontAttributeName:font};
//    CGSize size = [title sizeWithAttributes:dic];
    
    btn.frame = CGRectMake(0, 7, 80, 20);
    btn.titleLabel.font = font;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:UIColorFromRGB(0x0ea3f9) forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


+ (UIButton *)buttonWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName
{
    NSString *highlightedImageName = [NSString stringWithFormat:@"%@_h", imageName];
    return [self buttonWithTarget:target action:action imageName:imageName highlightedImageName:highlightedImageName];
}
+ (UIButton *)buttonWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}




+ (void)drawFrameInView:(UIView *)view top:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right
{
    CGRect frame = view.frame;
    CGRect newFrame = CGRectMake(frame.origin.x + left, frame.origin.y + top, frame.size.width - left - right, frame.size.height - top - bottom);
    [self drawFrameInView:view frame:newFrame];
}


+ (void)drawFrameInView:(UIView *)view frame:(CGRect)frame
{
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    CGFloat lineHeight = 1;
    NSValue *value1 = [NSValue valueWithCGRect:CGRectMake(x, y, lineHeight, height)];
    NSValue *value2 = [NSValue valueWithCGRect:CGRectMake(x + width, y, lineHeight, height + lineHeight)];
    NSValue *value3 = [NSValue valueWithCGRect:CGRectMake(x, y, width, lineHeight)];
    NSValue *value4 = [NSValue valueWithCGRect:CGRectMake(x, y + height, width, lineHeight)];
    NSArray *frames = @[value1, value2, value3, value4];
    [self drawLineInView:view frames:frames];
}


+ (void)drawLineInView:(UIView *)view frames:(NSArray *)frames
{
    for (NSValue *value in frames) {
        CGRect frame = [value CGRectValue];
        UIView *v = [[UIView alloc] initWithFrame:frame];
        v.backgroundColor = [UIColor blackColor];
        [view addSubview:v];
    }
}


+ (void)drawLineInView:(UIView *)view top:(CGFloat)top bottom:(CGFloat)bottom
{
    CGRect frame = CGRectMake(0, top, view.frame.size.width, 1);
    UIView *v = [[UIView alloc] initWithFrame:frame];
    v.backgroundColor = [UIColor blackColor];
    [view addSubview:v];
    
    frame = CGRectMake(0, view.frame.size.height - bottom, view.frame.size.width, 1);
    v = [[UIView alloc] initWithFrame:frame];
    v.backgroundColor = [UIColor blackColor];
    [view addSubview:v];
}
+ (void)drawLineInView:(UIView *)view left:(CGFloat)left right:(CGFloat)right
{
    CGRect frame = CGRectMake(left, 0, 1, view.frame.size.height);
    UIView *v = [[UIView alloc] initWithFrame:frame];
    v.backgroundColor = [UIColor blackColor];
    [view addSubview:v];
    
    frame = CGRectMake(view.frame.size.width - right, 0, 1, view.frame.size.height);
    v = [[UIView alloc] initWithFrame:frame];
    v.backgroundColor = [UIColor blackColor];
    [view addSubview:v];
}





#pragma mark - Layout Constraint
+ (void)fillTopInSuperView:(UIView *)superview subView:(UIView *)subView
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:subView.frame.size.height];
    [superview addConstraints:@[lc1, lc2, lc3]];
    [subView addConstraint:lc4];
}

+ (void)fillBottomInSuperView:(UIView *)superview subView:(UIView *)subView
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:subView.frame.size.height];
    [superview addConstraints:@[lc1, lc2, lc3]];
    [subView addConstraint:lc4];
}

+ (void)fillBottomInSuperView:(UIView *)superview subView:(UIView *)subView bottom:(CGFloat)bottom
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeBottom multiplier:1 constant:bottom];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:subView.frame.size.height];
    [superview addConstraints:@[lc1, lc2, lc3]];
    [subView addConstraint:lc4];
}

+ (void)fillInSuperView:(UIView *)superview subView:(UIView *)subView bottom:(CGFloat)bottom top:(CGFloat)top
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeBottom multiplier:1 constant:bottom];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTop multiplier:1 constant:-top];
    [superview addConstraints:@[lc1, lc2, lc3, lc4]];
}

+ (void)fillInSuperView:(UIView *)superview subView:(UIView *)subView bottom:(CGFloat)bottom top:(CGFloat)top width:(CGFloat)width right:(CGFloat)right
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:width];
    
    
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeBottom multiplier:1 constant:bottom];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:right];
    
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTop multiplier:1 constant:-top];
    [subView addConstraint:lc1];
    [superview addConstraints:@[lc2, lc3, lc4]];
}

+ (void)fillAllInSuperView:(UIView *)superview subView:(UIView *)subView
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [superview addConstraints:@[lc1, lc2, lc3, lc4]];
}


// 垂直居中, 水平左右相距10像素
+ (void)fillVMiddleHSameInSuperView:(UIView *)superview subView:(UIView *)subView
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:-10];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:10];
    
     NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:subView.frame.size.height];
    
    // 垂直居中
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    [subView addConstraint:lc4];
    
    [superview addConstraints:@[lc1, lc2, lc3]];
}

+ (void)fillVMidInSuperView:(UIView *)superview subView:(UIView *)subView top:(CGFloat)top
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    
    
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTop multiplier:1 constant:-top];
    
    
    
    
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:subView.frame.size.height];
    
    [subView addConstraint:lc2];
    
    [superview addConstraints:@[lc1, lc3, lc4]];
}























+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}



+ (NSString *)timeFormatted:(int)totalSeconds
{
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    NSString *hourStr = [NSString stringWithFormat:@"%02d小时", hours];
    NSString *minuteStr = [NSString stringWithFormat:@"%02d分钟", minutes];
    if (hours > 0) {
        return [NSString stringWithFormat:@"%@%@", hourStr, minuteStr];
    } else {
        return minuteStr;
    }
}
+ (NSString *)timeFormatted2:(int)totalSeconds
{
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    NSString *hourStr = [NSString stringWithFormat:@"%2d小时", hours];
    NSString *minuteStr = [NSString stringWithFormat:@"%2d分钟", minutes];
    if (hours > 0) {
        return [NSString stringWithFormat:@"%@%@", hourStr, minuteStr];
    } else {
        return minuteStr;
    }
}



#pragma mark - Analysis
+ (NSDictionary *)dictonaryFromDictionary:(NSDictionary *)dic key:(NSString *)key
{
    id idValue = [dic objectForKey:key];
    return [self dictonaryFromData:idValue];
}
+ (NSNumber *)numberFromDictionary:(NSDictionary *)dic key:(NSString *)key
{
    id idValue = [dic objectForKey:key];
    return [self numberFromData:idValue];
}
+ (NSString *)stringFromDictionary:(NSDictionary *)dic key:(NSString *)key
{
    id idValue = [dic objectForKey:key];
    if (idValue == nil) {
        return @"";
    }
    return [self stringFromData:idValue];
}

+ (NSArray *)arrayFromDictionary:(NSDictionary *)dic key:(NSString *)key
{
    id idValue = [dic objectForKey:key];
    return [self arrayFromData:idValue];
}


+ (NSDictionary *)dictonaryFromData:(id)data
{
    if ([data isKindOfClass:[NSDictionary class]]) {
        return data;
    } else {
        return [[NSDictionary alloc] init];
    }
}
+ (NSNumber *)numberFromData:(id)data
{
    if ([data isKindOfClass:[NSNumber class]]) {
        return data;
    } else {
        if ([data respondsToSelector:@selector(doubleValue)]) {
            double dValue = [data doubleValue];
            return [NSNumber numberWithDouble:dValue];
        } else {
            return [NSNumber numberWithInt:0];
        }
    }
}
+ (NSString *)stringFromData:(id)data
{
    if ([data isKindOfClass:[NSString class]]) {
        return data;
    } else if([data isKindOfClass:[NSNull class]]) {
        return @"";
    } else {
        return [NSString stringWithFormat:@"%@", data];
    }
}
+ (NSArray *)arrayFromData:(id)data
{
    if ([data isKindOfClass:[NSArray class]]) {
        return data;
    } else {
        return [[NSArray alloc] init];
    }
}



+ (NSString *)moneyStringWithDouble:(double)money
{
    NSString *str = [NSString stringWithFormat:@"%.2f", money];
    int index = (int)[str rangeOfString:@"."].location;
    NSString *prefix = [str substringToIndex:index];
    NSString *suffix = [str substringFromIndex:index + 1];
    int length = (int)prefix.length;
    int div = length / 3;
    int remain = length % 3;
    NSMutableArray *resultAry = [NSMutableArray array];
    if (remain == 0) {
        if (div == 0) {
            return [NSString stringWithFormat:@"0.%@", suffix];
        } else {
            for (int i = 0; i < div; i++) {
                NSRange range;
                range.location = i * 3;
                range.length = 3;
                NSString *tmp = [prefix substringWithRange:range];
                [resultAry addObject:tmp];
            }
        }
    } else {
        if (div == 0) {
            return [NSString stringWithFormat:@"%@.%@", prefix, suffix];
        } else {
            for (int i = 0; i < div + 1; i++) {
                NSRange range;
                if (i == 0) {
                    range.location = 0;
                    range.length = remain;
                } else {
                    range.location = remain + 3 * (i - 1);
                    range.length = 3;
                }
                NSString *tmp = [prefix substringWithRange:range];
                [resultAry addObject:tmp];
            }
        }
    }
    NSString *tmp2 = [resultAry componentsJoinedByString:@","];
    NSString *result = [NSString stringWithFormat:@"%@.%@", tmp2, suffix];
    return result;
}


+ (NSString *)percentWithDouble:(double)percent
{
    double tmp = percent * 100;
    return [NSString stringWithFormat:@"%.1f%@", tmp, @"%"];
}



+ (void)iOS6GroupedTableView:(UITableView *)tableView cell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 此方法只在ios7下起作用
    if ([[UIDevice currentDevice].systemVersion floatValue] < 7.0) {
        return;
    }
    if ([cell respondsToSelector:@selector(tintColor)]) {
        
        if ( tableView ) {
            
            CGFloat cornerRadius = 5.f;
            
            // cell.backgroundColor = UIColor.clearColor;
            
            CAShapeLayer *layer = [[CAShapeLayer alloc] init];
            CAShapeLayer *layermask = [[CAShapeLayer alloc] init];
            CGMutablePathRef pathRef = CGPathCreateMutable();
            CGMutablePathRef pathRefLine = CGPathCreateMutable();
            
            CGRect bounds = CGRectInset(cell.bounds, 8, 0);
            
            BOOL addLine = NO;
            
            if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
                
                CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
                CGPathAddRoundedRect(pathRefLine, nil, bounds, cornerRadius, cornerRadius);
                
            } else if (indexPath.row == 0) {
                
                CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
                
                CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
                
                CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
                
                CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
                
                //
                CGPathMoveToPoint(pathRefLine, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
                
                CGPathAddArcToPoint(pathRefLine, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
                
                CGPathAddArcToPoint(pathRefLine, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
                
                CGPathAddLineToPoint(pathRefLine, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
                
            } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
                
                CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
                
                CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
                
                CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
                
                CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
                
                //
                CGPathMoveToPoint(pathRefLine, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
                
                CGPathAddArcToPoint(pathRefLine, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
                
                CGPathAddArcToPoint(pathRefLine, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
                
                CGPathAddLineToPoint(pathRefLine, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
                
                CGPathAddLineToPoint(pathRefLine, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
                
            } else {
                CGPathMoveToPoint(pathRefLine, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
                CGPathAddLineToPoint(pathRefLine, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
                CGPathAddLineToPoint(pathRefLine, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
                CGPathAddLineToPoint(pathRefLine, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
                CGPathAddRect(pathRef, nil, bounds);
                
                addLine = YES;
                
            }
            
            layer.path = pathRefLine;
            layermask.path = pathRef;
            CFRelease(pathRef);
            layer.strokeColor = [UIColor colorWithRed:222/255.0f green:222/255.0f blue:222/255.0f alpha:1].CGColor;
            layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
            layer.strokeColor = [UIColor blackColor].CGColor;
//            layer.fillColor = [UIColor blackColor].CGColor;
            
            UIView *testView = [[UIView alloc] initWithFrame:bounds];
            
            [testView.layer insertSublayer:layer atIndex:0];
            
            testView.backgroundColor = UIColor.clearColor;
            
            cell.backgroundView = testView;
            cell.layer.mask = layermask;
            [cell addSubview:cell.detailTextLabel];
            cell.contentView.bounds = CGRectMake(-CGRectGetMinX(bounds), 0, 0, 0);
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        }
    }
}



#pragma mark - Tool



#pragma mark - Date Fromat

+ (NSString *)dateStringFromDate:(NSDate *)date format:(RXDateFormat)format
{
    NSString *formatStr = @"";
    switch (format) {
        case kRXDateFormatAllFormat1:
            formatStr = @"yyyy年MM月dd日 HH时mm分";
            break;
        case kRXDateFormatAllFormat2:
            formatStr = @"yyyy.MM.dd HH:mm";
            break;
        case kRXDateFormatDate:
            formatStr = @"yyyy-MM-dd";
            break;
        case kRXDateFormatDate2:
            formatStr = @"yyyy年MM月dd日";
            break;
        case kRXDateFormatFormat1:
            formatStr = @"HH:mm";
            break;
        case kRXDateFormatFormat2:
            formatStr = @"M月d日";
            break;
        case kRXDateFormatDate3:
            formatStr = @"yyyyMMdd";
            break;
        case kRXDateFormatDate4:
            formatStr = @"yyyyMM";
            break;
        case kRXDateFormatDate5:
            formatStr = @"M月yyyy年";
            break;
        case kRXDateFormatDate6:
            formatStr = @"yyyyMMddHHmm";
            break;
        case kRXDateFormatDate7:
            formatStr = @"yyyy.M.d HH:mm";
            break;
        case kRXDateFormatDate8:
            formatStr = @"yyyy.MM.dd";
            break;
        case kRXDateFormatDate9:
            formatStr = @"yyyy年M月d日";
            break;
        case  kRXDateFormatDate10:
            formatStr = @"yyyy年M月";
            break;
        default:
            formatStr = @"yyyy年MM月dd日 hh时mm分ss秒";
            break;
    }
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setDateFormat:formatStr];
    NSString *result = [formatter stringFromDate:date];
    return result;
}


+ (NSDate *)dateFromMilliSecond:(long long)milliSecond
{
    return [self dateFromSecond:milliSecond / 1000];
}
+ (NSDate *)dateFromSecond:(long long)second
{
    return [NSDate dateWithTimeIntervalSince1970:second];
}

#pragma mark -friendsList
+ (NSString *)getFriendsInfoPath {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *path = [userDefault objectForKey:@"friendListBasicInfo"];
    return path;
}


+ (NSString *)transformToPinyinWithString:(NSString *)str {
    NSMutableString *mutableString = [NSMutableString stringWithString:str];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformStripDiacritics, false);
    NSString *result = [NSString stringWithFormat:@"%@", mutableString];
    result = [result stringByReplacingOccurrencesOfString:@" " withString:@""];
    return result;
}

static NSString *sAppVersion = nil;
#pragma mark - versions
+ (NSString*)getAppVersion
{
    if (sAppVersion == nil)
    {
#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:bundlePath];
#if DISTRIBUTION
        sAppVersion = [dict objectForKey:@"CFBundleShortVersionString"];
#else
        sAppVersion = [dict objectForKey:@"CFBundleVersion"];
#endif
#else
        NSString *shortVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        NSString *bundleVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
        if (!XM_IS_STR_NIL(shortVersion) && !XM_IS_STR_NIL(bundleVersion)) {
            sAppVersion = [NSString stringWithFormat:@"%@.%@", shortVersion, bundleVersion];
        }
#endif
    }
    
    return sAppVersion;
}

+ (NSString *)getSystemVersion
{
//    NSString *strOSVersion = [NSString stringWithFormat:@"%@ %@", [UIDevice currentDevice].systemName, [UIDevice currentDevice].systemVersion];
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)getSystemLanguage
{
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    return language;
}

+ (CGFloat)screenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}

@end
