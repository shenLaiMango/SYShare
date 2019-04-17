//
//  MYWeibo.h
//  WebDome
//
//  Created by cxx on 2019/4/16.
//  Copyright © 2019年 陈诗友. All rights reserved.
//
/* 新浪 */
#import <Foundation/Foundation.h>
#import <WeiboSDK.h>

@class WeiBoPushModel;
@interface MYWeibo : NSObject

/* 新浪分享-网页类型 */
+ (void)shareWebpageObjectWeibo:(WeiBoPushModel *)model;

/* 新浪分享-图片加文字类型 */
+ (void)shareImageObjectWeibo:(WeiBoPushModel *)model;

/* 新浪分享-文字类型 */
+ (void)shareMessageWeiboContent:(WeiBoPushModel *)model;

@end

/* 模型 */
@interface WeiBoPushModel : NSObject

@property (nonatomic,strong) NSString *content;/* 内容 */
@property (nonatomic,strong) UIImage *maxImage;/* 分享的图片 */
@property (nonatomic,strong) NSString *webpageUrl;/* 网页的url地址 */


@end
