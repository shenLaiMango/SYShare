//
//  AppDelegate+appkey.m
//  WebDome
//
//  Created by cxx on 2019/4/11.
//  Copyright © 2019年 陈诗友. All rights reserved.
//

#import "AppDelegate+appkey.h"



/* 微信 */
#define WXAppID            @""
#define WXAppSecret        @""


/* QQ */
#define QQAppID            @""
#define QQAppSecret        @""

/* 新浪 */
#define SineAppID          @""
#define SineAppSecret      @""
#define SineRedirectUri    @""

@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate (appkey)

/* 分享 初始化 */
- (void)registerApp
{
    /* 微信 初始化 */
    [self WXApiregisterApp];
    /* 腾讯 QQ 初始化 */
    [self TencentOAuthApiregisterApp];
    /* 新浪 初始化 */
    [self weiboApiregisterApp];
}

/* 微信 初始化 */
- (void)WXApiregisterApp
{
    /* 向微信注册 */
    [WXApi registerApp:WXAppID];
}

/* 腾讯 QQ 初始化 */
- (void)TencentOAuthApiregisterApp
{
    /* 腾讯 QQ 注册 */
    (void)[[TencentOAuth alloc] initWithAppId:QQAppID andDelegate:(id<TencentSessionDelegate>)self];
}


/* 新浪 初始化 */
- (void)weiboApiregisterApp
{
    /* 新浪 注册 */
    [WeiboSDK registerApp:SineAppID];
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
    /* 腾讯 QQ */
    if ([TencentOAuth HandleOpenURL:url]) {
        return [TencentOAuth HandleOpenURL:url];
    }
    
    /* 微信 */
    return  [WXApi handleOpenURL:url delegate:self];

}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    /* 腾讯 QQ */
    if ([TencentOAuth HandleOpenURL:url]) {
        return [TencentOAuth HandleOpenURL:url];
    }
    
    /* 微信 */
    return  [WXApi handleOpenURL:url delegate:self];
}



@end
