//
//  RXCTImageFrame.h
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/3.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXCTImageFrame : NSObject



@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, assign) int position;

// 此坐标是 CoreText 的坐标系，而不是UIKit的坐标系
@property (nonatomic, assign) CGRect imagePosition;


@end
