//
//  MYWeChat.h
//  WebDome
//
//  Created by cxx on 2019/4/11.
//  Copyright © 2019年 陈诗友. All rights reserved.
//

/* 微信 */
#import <Foundation/Foundation.h>
#import <WechatOpenSDK/WXApi.h>

NS_ASSUME_NONNULL_BEGIN
@class WeChatPushModel;
@interface MYWeChat : NSObject

/* 微信分享-网页类型 */
/* WXSceneSession 好友会话 , WXSceneTimeline 朋友圈 */
+ (void)shareWebpageObjectWeChat:(int)wxScene
                    shareContent:(WeChatPushModel *)model;

/* 微信分享-图片类型 */
/* WXSceneSession 好友会话 , WXSceneTimeline 朋友圈 */
+ (void)shareImageObjectWeChat:(int)wxScene
                  shareContent:(WeChatPushModel *)model;

/* 微信分享-文字类型 */
/* WXSceneSession 好友会话 , WXSceneTimeline 朋友圈 */
+ (void)shareMessageWeChat:(int)wxScene
              shareContent:(WeChatPushModel *)model;

/* 拉起的微信小程序 */
/*  @param QQOrZone 0 ->QQ ,1 -->zone */
+ (void)pullUpWeChatApplet:(WeChatPushModel *)model;

@end


/* 模型 */
@interface WeChatPushModel : NSObject

@property (nonatomic,strong) NSString *userName;/* 标题 */
@property (nonatomic,strong) NSString *path;/* 跳转的页面 */
@property (nonatomic,assign) WXMiniProgramType miniType;/* 拉起小程序的类型 */
@property (nonatomic,strong) NSString *content;/* 内容 */
@property (nonatomic,strong) UIImage *maxImage;/* 分享的图片 */
@property (nonatomic,strong) UIImage *thumbimage;/* 缩略图 */
@property (nonatomic,strong) NSString *webpageUrl;/* 网页的url地址 */
@end

NS_ASSUME_NONNULL_END
