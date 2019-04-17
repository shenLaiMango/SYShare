//
//  MYWeibo.m
//  WebDome
//
//  Created by cxx on 2019/4/16.
//  Copyright © 2019年 陈诗友. All rights reserved.
//
/* 新浪 */
#import "MYWeibo.h"

@interface MYWeibo ()


@end

@implementation MYWeibo

/* 新浪分享-网页类型 */
+ (void)shareWebpageObjectWeibo:(WeiBoPushModel *)model
{
    NSData *weiboimageData = [NSData data];
    weiboimageData = UIImageJPEGRepresentation(model.maxImage, 0.7);
    
    
    /* 图片 */
    WBImageObject *imageMessage = [WBImageObject object];
    imageMessage.imageData = weiboimageData;
    /* 文字 链接 */
    WBMessageObject *message = [WBMessageObject message];
    message.text = [NSString stringWithFormat:@"%@ \n%@",model.content,model.webpageUrl];
    message.imageObject = imageMessage;

    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message];
    [WeiboSDK sendRequest:request];
}

/* 新浪分享-图片加文字类型 */
+ (void)shareImageObjectWeibo:(WeiBoPushModel *)model
{
    NSData *weiboimageData = [NSData data];
    weiboimageData = UIImageJPEGRepresentation(model.maxImage, 0.7);
    
    
    /* 图片 */
    WBImageObject *imageMessage = [WBImageObject object];
    imageMessage.imageData = weiboimageData;
    /* 文字 */
    WBMessageObject *message = [WBMessageObject message];
    message.text = model.content;
    message.imageObject = imageMessage;
    
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message];
    [WeiboSDK sendRequest:request];
}

/* 新浪分享-文字类型 */
+ (void)shareMessageWeiboContent:(WeiBoPushModel *)model
{
    WBMessageObject *message = [WBMessageObject message];
    message.text = model.content;
    
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message];
    [WeiboSDK sendRequest:request];
}


@end



@implementation WeiBoPushModel



@end
