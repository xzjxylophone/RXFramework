//
//  RXDefine.h
//  TestURL
//
//  Created by Rush.D.Xzj on 15-3-26.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>


// 此文件的内容 都是RX部分的,跟app 无关


#ifndef RX_SDKURLScheme
#define RX_SDKURLScheme        @"wdpage"
#endif


#define RXLogSwitch        1


#if RXLogSwitch
#define RXLog(frmt, ...)   NSLog(frmt, ##__VA_ARGS__)
#define RXWarning(frmt, ...)   NSLog(frmt, ##__VA_ARGS__)
#else
#define RXLog(frmt, ...)   do{}while(0)
#define RXWarning(frmt, ...)   do{}while(0)
#endif




// Notification Key example
#define NKey_RX_kkkkkk  @"NKey_RX_kkkkkk"

// UserDefault Key example
#define UDKey_RX_kkkk       @"UDKey_RX_kkkk"



// enum example
typedef enum E_RX_Type {
    kE_RX_Type_1,
    kE_RX_Type_2,
}E_RX_Type;


// UI example
#define k_UI_RX_Font12       [UIFont systemFontOfSize:12]
#define k_UI_RX_FontB12      [UIFont boldSystemFontOfSize:12]
#define k_UI_RX_LineColor   UIColorFromRGB(0xe1e1e1)

// ActionSheet Example
#define k_ActionSheet_RX_DeleteCourseOnce           1


// AlertView Example
#define k_AlertView_RX_DeleteCourseOnce           1


// 常量各种定义的key
#define k_CS_RX_QQ_AppId        @"1104800507"
#define k_CS_RX_Bmob_Secret_Key             @"85fcb166119163e1"
#define K_CS_RX_WeiXin_AppSecert    @"bbab14abb374389f694e681316890217"


#define RX_IsIPhone4_4s        ([UIScreen mainScreen].bounds.size.height < 500)
#define RX_IsiOS8_0_Or_Later    ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0f)






#pragma mark - SKey

#define SKey_aapage             @"aapage"
#define SKey_account            @"account"
#define SKey_accountAmount      @"accountAmount"
#define SKey_accountId          @"accountId"
#define SKey_action             @"action"
#define SKey_address            @"address"
#define SKey_age                @"age"
#define SKey_alert              @"alert"
#define SKey_allowRepublish     @"allowRepublish"
#define SKey_amount             @"amount"
#define SKey_annualisedRates    @"annualisedRates"
#define SKey_apiBorrowId        @"apiBorrowId"
#define SKey_apiCategoryId      @"apiCategoryId"
#define SKey_apiCityId          @"apiCityId"
#define SKey_apiMallId          @"apiMallId"
#define SKey_apiQueryType       @"apiQueryType"
#define SKey_apiOrderCode       @"apiOrderCode"
#define SKey_apiOrderStatus     @"apiOrderStatus"
#define SKey_apiShopId          @"apiShopId"
#define SKey_apiShopTitle       @"apiShopTitle"
#define SKey_apiType            @"apiType"
#define SKey_apiUserId          @"apiUserId"
#define SKey_aps                @"aps"
#define SKey_array              @"array"

#define SKey_balanceAmt         @"balanceAmt"
#define SKey_balancePayAmt      @"balancePayAmt"
#define SKey_balanceRecords     @"balanceRecords"
#define SKey_balanceType        @"balanceType"
#define SKey_bankName           @"bankName"
#define SKey_bindCardFlag       @"bindCardFlag"
#define SKey_block              @"block"
#define SKey_bombBorrowList     @"bombBorrowList"
#define SKey_bombFlag           @"bombFlag"
#define SKey_bombCreateTime     @"bombCreateTime"
#define SKey_bombBurstTime      @"bombBurstTime"
#define SKey_bombVoteFlag       @"bombVoteFlag"
#define SKey_borrow             @"borrow"
#define SKey_borrowAmount       @"borrowAmount"
#define SKey_borrowDays         @"borrowDays"
#define SKey_borrowHours        @"borrowHours"
#define SKey_borrowMonths       @"borrowMonths"
#define SKey_borrowId           @"borrowId"
#define SKey_borrowInfo         @"borrowInfo"
#define SKey_borrowList         @"borrowList"
#define SKey_borrowMonths       @"borrowMonths"
#define SKey_borrowNumber       @"borrowNumber"
#define SKey_borrowReason       @"borrowReason"
#define SKey_buyer              @"buyer"
#define SKey_buyerMessage       @"buyerMessage"
#define SKey_buyerUserId        @"buyerUserId"
#define SKey_buyerUserName      @"buyerUserName"

#define SKey_cardId             @"cardId"
#define SKey_carId              @"carId"
#define SKey_cashBuyBreakCount  @"cashBuyBreakCount"
#define SKey_cashBuyCount       @"cashBuyCount"
#define SKey_cashPayAmt         @"cashPayAmt"
#define SKey_cashSell           @"cashSell"
#define SKey_cashSellBreakCount @"casehSellBreakCount"
#define SKey_cashSellCount      @"cashSellCount"
#define SKey_category           @"category"
#define SKey_categoryId         @"categoryId"
#define SKey_categorys          @"categorys"
#define SKey_checkCode          @"checkCode"
#define SKey_cities             @"cities"
#define SKey_cityId             @"cityId"
#define SKey_cityTitle          @"cityTitle"
#define SKey_closable           @"closable"
#define SKey_closed             @"closed"
#define SKey_code               @"code"
#define SKey_comment            @"comment"
#define SKey_commentable        @"commentable"
#define SKey_commentCount       @"commentCount"
#define SKey_commentId          @"commentId"
#define SKey_commentList        @"commentList"
#define SKey_commentNumber      @"commentNumber"
#define SKey_commentsNumber     @"commentsNumber"
#define SKey_complainCount      @"complainCount"
#define SKey_complainedCount    @"complainedCount"
#define SKey_confirm            @"confirm"
#define SKey_constellation      @"constellation"
#define SKey_contactId          @"contactId"
#define SKey_contactInfo        @"contactInfo"
#define SKey_contactList        @"contactList"
#define SKey_content            @"content"
#define SKey_contentJson        @"contentJson"
#define SKey_contentType        @"contentType"
#define SKey_count              @"count"
#define SKey_course             @"course"
#define SKey_courseRemind       @"courseRemind"
#define SKey_createDate         @"createDate"
#define SKey_creater            @"creater"
#define SKey_createrId          @"createrId"
#define SKey_createTime         @"createTime"
#define SKey_creditAmount       @"creditAmount"
#define SKey_creditedPersonNumber   @"creditedPersonNumber"
#define SKey_creditedTotalAmount    @"creditedTotalAmount"
#define SKey_creditFlag         @"creditFlag"
#define SKey_creditModifyTime   @"creditModifyTime"
#define SKey_creditPersonNumber @"creditPersonNumber"
#define SKey_creditRating       @"creditRating"
#define SKey_creditTotalAmount  @"creditTotalAmount"
#define SKey_curAmount          @"curAmount"
#define SKey_curBorrowAmount    @"curBorrowAmount"
#define SKey_curBorrowPnum      @"curBorrowPnum"
#define SKey_curInviteCount     @"curInviteCount"
#define SKey_curReceiveAmount   @"curReceiveAmount"
#define SKey_currentCashSellNum @"currentCashSellNum"
#define SKey_currentPage        @"currentPage"
#define SKey_currentRewardNum   @"currentRewardNum"

#define SKey_data               @"data"
#define SKey_date               @"date"
#define SKey_dayRate            @"dayRate"
#define SKey_defi               @"defi"
#define SKey_deviceId           @"deviceId"
#define SKey_deviceToken        @"deviceToken"
#define SKey_deviceType         @"deviceType"
#define SKey_dId                @"dId"
#define SKey_direction          @"direction"
#define SKey_displayDate        @"displayDate"
#define SKey_distance           @"distance"
#define SKey_down               @"down"
#define SKey_dunningTime        @"dunningTime"

#define SKey_email              @"email"
#define SKey_endtime            @"endtime"
#define SKey_error              @"error"
#define SKey_errorno            @"errorno"
#define SKey_expired            @"expired"

#define SKey_failed             @"failed"
#define SKey_forfeitAmount      @"forfeitAmount"
#define SKey_forfeitRate        @"forfeitRate"
#define SKey_friendId           @"friendId"

#define SKey_gender             @"gender"
#define SKey_gesturePwd         @"gesturePwd"

#define SKey_haveOpenGesturePwd @"haveOpenGesturePwd"
#define SKey_home               @"home"
#define SKey_hour               @"hour"

#define SKey_id                 @"id"
#define SKey_img                @"img"
#define SKey_increase           @"increase"
#define SKey_interest           @"interest"
#define SKey_interestAmount     @"interestAmount"
#define SKey_invalidTime        @"invalidTime"
#define SKey_ispay              @"ispay"
#define SKey_isPush             @"isPush"

#define SKey_job                @"job"

#define SKey_lastPublishTime    @"lastPublishTime"
#define SKey_lastReadId         @"lastReadId"
#define SKey_lat                @"lat"
#define SKey_lendAmount         @"lendAmount"
#define SKey_lendInfo           @"lendInfo"
#define SKey_lend               @"lend"
#define SKey_lendAmount         @"lendAmount"
#define SKey_lendFlag           @"lendFlag"
#define SKey_lendInterest       @"lendInterest"
#define SKey_limit              @"limit"
#define SKey_lng                @"lng"
#define SKey_location           @"location"
#define SKey_loginPwd           @"loginPwd"
#define SKey_loginName          @"loginName"

#define SKey_make               @"make"
#define SKey_mallId             @"mallId"
#define SKey_mallList           @"mallList"
#define SKey_malls              @"malls"
#define SKey_mallTitle          @"mallTitle"
#define SKey_mark               @"mark"
#define SKey_maxInviteCount     @"maxInviteCount"
#define SKey_me                 @"me"
#define SKey_mealTime           @"mealTime"
#define SKey_mealNum            @"mealNum"
#define SKey_message            @"message"
#define SKey_messageCount       @"messageCount"
#define SKey_messageId          @"messageId"
#define SKey_messageList        @"messageList"
#define SKey_messageType        @"messageType"
#define SKey_mobile             @"mobile"
#define SKey_mobileNum          @"mobileNum"
#define SKey_model              @"model"
#define SKey_modifyTime         @"modifyTime"
#define SKey_msg                @"msg"
#define SKey_my                 @"my"

#define SKey_name               @"name"
#define SKey_newPassword        @"newPassword"
#define SKey_nickName           @"nickName"
#define SKey_notAllowRepublish  @"notAllowRepublish"
#define SKey_notClosable        @"notClosable"
#define SKey_notCommentable     @"notCommentable"
#define SKey_notConfirm         @"notConfirm"
#define SKey_noticeFlag         @"noticeFlag"
#define SKey_notPaid            @"notPaid"
#define SKey_notUndertakenStatus    @"notUndertakenStatus"
#define SKey_notWatingStatus    @"notWatingStatus"

#define SKey_offset             @"offset"
#define SKey_oldPassword        @"oldPassword"
#define SKey_orderAmt           @"orderAmt"
#define SKey_orderCode          @"orderCode"
#define SKey_orderNo            @"orderNo"
#define SKey_ordersNum          @"ordersNum"
#define SKey_ordersList         @"ordersList"
#define SKey_orderStatus        @"orderStatus"
#define SKey_orderType          @"orderType"
#define SKey_overdueNumber      @"overdueNumber"
#define SKey_ownerMobile        @"ownerMobile"
#define SKey_ownerUserId        @"ownerUserId"

#define SKey_paid               @"paid"
#define SKey_password           @"password"
#define SKey_payPwd             @"payPwd"
#define SKey_payStatus          @"payStatus"
#define SKey_phoneNumber        @"phoneNumber"
#define SKey_photo              @"photo"
#define SKey_photoResId         @"photoResId"
#define SKey_pictures           @"pictures"
#define SKey_panaltyInterest    @"panaltyInterest"
#define SKey_panaltyRate        @"panaltyRate"
#define SKey_panaltyTimes       @"panaltyTimes"
#define SKey_pointAmt           @"pointAmt"
#define SKey_pointPayAmt        @"pointPayAmt"
#define SKey_pointRecords       @"pointRecords"
#define SKey_pointType          @"pointType"
#define SKey_price              @"price"
#define SKey_publishCount       @"publishCount"
#define SKey_pwd                @"pwd"

#define SKey_queryId            @"queryId"
#define SKey_queryType          @"queryType"

#define SKey_rating             @"rating"
#define SKey_registered         @"registered"
#define SKey_registerTime       @"registerTime"
#define SKey_registerType       @"registerType"
#define SKey_raiseTime          @"raiseTime"
#define SKey_realPanaltyInterest    @"realPanaltyInterest"
#define SKey_realRepayAmount    @"realRepayAmount"
#define SKey_receiveAmount      @"receiveAmount"
#define SKey_remark             @"remark"
#define SKey_repayAmount        @"repayAmount"
#define SKey_repayInfo          @"repayInfo"
#define SKey_repayment          @"repayment"
#define SKey_repayTime          @"repayTime"
#define SKey_result             @"result"
#define SKey_returnAmount       @"returnAmount"
#define SKey_reverseCreditFlag  @"reverseCreditFlag"
#define SKey_reward             @"reward"
#define SKey_rewardBreakCount   @"rewardBreakCount"
#define SKey_rewardCount        @"rewardCount"
#define SKey_rewardLevel        @"rewardLevel"
#define SKey_roleCode           @"roleCode"

#define SKey_scheme             @"scheme"
#define SKey_school             @"school"
#define SKey_selectSQCity       @"selectSQCity"
#define SKey_seller             @"seller"
#define SKey_sellerUserId       @"sellerUserId"
#define SKey_sellerUserName     @"sellerUserName"
#define SKey_sender             @"sender"
#define SKey_sessionId          @"sessionId"
#define SKey_source             @"source"
#define SKey_sourceId           @"sourceId"
#define SKey_shop               @"shop"
#define SKey_shopAddress        @"shopAddress"
#define SKey_shopId             @"shopId"
#define SKey_shops              @"shops"
#define SKey_shopTel            @"shopTel"
#define SKey_shopTitle          @"shopTitle"
#define SKey_sign               @"sign"
#define SKey_signature          @"signature"
#define SKey_signRemind         @"signRemind"
#define SKey_skey               @"skey"
#define SKey_sponsorUserId      @"sponsorUserId"
#define SKey_startIndex         @"startIndex"
#define SKey_starttime          @"starttime"
#define SKey_state              @"state"
#define SKey_status             @"status"
#define SKey_stateMsg           @"stateMsg"
#define SKey_str1               @"str1"
#define SKey_str2               @"str2"
#define SKey_student            @"student"
#define SKey_subType            @"subType"
#define SKey_SUCCESS            @"SUCCESS"

#define SKey_teacher            @"teacher"
#define SKey_temperature        @"temperature"
#define SKey_thumbnail          @"thumbnail"
#define SKey_tipAmt             @"tipAmt"
#define SKey_title              @"title"
#define SKey_time               @"time"
#define SKey_todayReturnAmount  @"todayReturnAmount"
#define SKey_token              @"token"
#define SKey_totalBorrowAmount  @"totalBorrowAmount"
#define SKey_tradeAmount        @"tradeAmount"
#define SKey_tradeDesc          @"tradeDesc"
#define SKey_tradeId            @"tradeId"
#define SKey_tradeList          @"tradeList"
#define SKey_tradeMode          @"tradeMode"
#define SKey_tradePassword      @"tradePassword"
#define SKey_tradeTime          @"tradeTime"
#define SKey_tradeType          @"tradeType"
#define SKey_type               @"type"
#define SKey_twoWayFlag         @"twoWayFlag"

#define SKey_underBreakCount    @"underBreakCount"
#define SKey_underCount         @"underCount"
#define SKey_undertakenStatus   @"undertakenStatus"
#define SKey_up                 @"up"
#define SKey_updatePackageInfo  @"updatePackageInfo"
#define SKey_updatetime         @"updatetime"
#define SKey_updateTime         @"updateTime"
#define SKey_unReadCount        @"unReadCount"
#define SKey_userId             @"userId"
#define SKey_user               @"user"
#define SKey_userInfo           @"userInfo"
#define SKey_userName           @"userName"
#define SKey_useType            @"useType"

#define SKey_version            @"version"
#define SKey_verificationCode   @"verificationCode"
#define SKey_view               @"view"
#define SKey_voteResult         @"voteResult"

#define SKey_watingStatus       @"watingStatus"
#define SKey_weather            @"weather"
#define SKey_willReturnAmount   @"willReturnAmount"









































