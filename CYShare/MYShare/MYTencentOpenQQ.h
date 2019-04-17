//
//  MYTencentOpenQQ.h
//  WebDome
//
//  Created by cxx on 2019/4/11.
//  Copyright © 2019年 陈诗友. All rights reserved.
//
/* 腾讯 QQ */

#import <UIKit/UIKit.h>
//QQ分享
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/QQApiInterfaceObject.h>

NS_ASSUME_NONNULL_BEGIN
@class TencentOpenQQPushModel;
@interface MYTencentOpenQQ : NSObject

/* 腾讯 QQ分享-新闻类型 */
/*  @param QQOrZone 0 ->QQ ,1 -->zone */
+ (void)shareNewsObjectQQ:(int)QQOrZone
              shareContent:(TencentOpenQQPushModel *)model;

/* 腾讯 QQ分享-纯图片类型 */
/*  @param QQOrZone 0 ->QQ ,1 -->zone */
+ (void)shareImageObjectQQ:(int)QQOrZone
              shareContent:(TencentOpenQQPushModel *)model;

/* 腾讯 QQ分享-纯文本类型 */
/*  @param QQOrZone 0 ->QQ ,1 -->zone */
+ (void)shareTextMessageQQ:(int)QQOrZone
              shareContent:(TencentOpenQQPushModel *)model;

@end

/* 模型 */
@interface TencentOpenQQPushModel : NSObject

@property (nonatomic,strong) NSString *userName;/* 标题 */
@property (nonatomic,strong) NSString *path;/* 跳转的页面 */
@property (nonatomic,strong) NSString *content;/* 内容 */
@property (nonatomic,strong) UIImage *maxImage;/* 分享的图片 */
@property (nonatomic,strong) NSString *maxImageUrl;/* 分享的图片url地址 */
@property (nonatomic,strong) UIImage *thumbimage;/* 缩略图 */
@property (nonatomic,strong) NSString *webpageUrl;/* 网页的url地址 */
@property (nonatomic,assign) NSInteger maxImageInt;/* 分享的图片 1--> data | 0 --> url地址 */
@end
NS_ASSUME_NONNULL_END
