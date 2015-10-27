//
//  RXIvLblView.h
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/27.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum E_RX_IvLblViewAlignment {
    kE_RX_IvLblViewAlignmengt_Iv_Lbl            =       0, // 左iv右lbl
    kE_RX_IvLblViewAlignmengt_Lbl_Iv, // 左lbl右iv
}E_RX_IvLblViewAlignment;


@interface RXIvLblView : UIView



// Default is kE_RX_IvLblViewAlignmengt_Iv_Lbl
@property (nonatomic, assign) E_RX_IvLblViewAlignment e_RX_IvLblViewAlignment;
// iv 与 lbl 之间的间距, Default is Zero
@property (nonatomic, assign) CGFloat offset;

// Default is (0,0),  当有0的时候表示没有限制
@property (nonatomic, assign) CGSize maxSize;

@property (nonatomic, strong) UILabel *lbl;
@property (nonatomic, strong) UIImageView *iv;



- (void)fitToSuitable;



@end
