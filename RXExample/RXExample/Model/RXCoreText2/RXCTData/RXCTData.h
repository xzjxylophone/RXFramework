//
//  RXCTData.h
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/3.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum E_RX_CTDataType {
    kE_RX_CTDataType_Text               =           1,
    kE_RX_CTDataType_Img,
    kE_RX_CTDataType_Link,
}E_RX_CTDataType;



@interface RXCTData : NSObject


@property (nonatomic, assign) E_RX_CTDataType dataType;

@end
