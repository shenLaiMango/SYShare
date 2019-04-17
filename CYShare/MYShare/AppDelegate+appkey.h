//
//  AppDelegate+appkey.h
//  WebDome
//
//  Created by cxx on 2019/4/11.
//  Copyright © 2019年 陈诗友. All rights reserved.
//
/* 分享 初始化 */
#import "AppDelegate.h"
#import "WXApi.h" /* 微信 */
#import <TencentOpenAPI/TencentOAuth.h> /* 腾讯 QQ */
#import <WeiboSDK.h> /* 新浪 */
NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (appkey)

/* 分享 初始化 */
- (void)registerApp;

@end

NS_ASSUME_NONNULL_END
