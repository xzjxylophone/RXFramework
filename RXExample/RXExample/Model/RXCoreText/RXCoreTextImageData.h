//
//  RXCoreTextImageData.h
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/2.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXCoreTextImageData : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int position;

// 此坐标是 CoreText 的坐标系，而不是UIKit的坐标系
@property (nonatomic, assign) CGRect imagePosition;
@end
