//
//  MYWeChat.m
//  WebDome
//
//  Created by cxx on 2019/4/11.
//  Copyright © 2019年 newShortVideo. All rights reserved.
//

#import "MYWeChat.h"

@implementation MYWeChat


/* 微信分享-网页类型 */
+ (void)shareWebpageObjectWeChat:(int)wxScene
shareContent:(WeChatPushModel *)model

{
    WXWebpageObject *webpageObject = [WXWebpageObject object];
    webpageObject.webpageUrl = model.webpageUrl;
    
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = model.userName;/* 标题 */
    message.description = model.content; /* 描述 */
    [message setThumbImage:model.thumbimage];
    message.mediaObject = webpageObject;
    
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;/* 多媒体消息两种 */
    req.message = message;
    req.scene = wxScene;
    [WXApi sendReq:req];
}


/* 微信分享-图片类型 */
+ (void)shareImageObjectWeChat:(int)wxScene
shareContent:(WeChatPushModel *)model
{
    NSData *imageData = [NSData data];
    imageData = UIImageJPEGRepresentation(model.maxImage, 0.7);
    
    WXImageObject *imageObject = [WXImageObject object];
    imageObject.imageData = imageData;
    WXMediaMessage *message = [WXMediaMessage message];
    
    message.mediaObject = imageObject;
    //    message
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = NO; /* 多媒体消息两种 */
    req.message = message;
    req.scene = wxScene;
    [WXApi sendReq:req];
}


/* 微信分享-文字类型 */
+ (void)shareMessageWeChat:(int)wxScene
shareContent:(WeChatPushModel *)model
{
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = YES; /* 文本消息 */
    req.text = model.content;
    req.scene = wxScene;
    [WXApi sendReq:req];
}



/* 拉起的微信小程序 */
+ (void)pullUpWeChatApplet:(WeChatPushModel *)model
{
    if ([WXApi isWXAppInstalled]) {
        WXLaunchMiniProgramReq *launchMiniProgramReq = [WXLaunchMiniProgramReq object];
        launchMiniProgramReq.userName = model.userName;  //拉起的小程序的username-原始ID
        launchMiniProgramReq.path = model.path;    //拉起小程序页面的可带参路径，不填默认拉起小程序首页
        launchMiniProgramReq.miniProgramType = model.miniType; //拉起小程序的类型
        [WXApi sendReq:launchMiniProgramReq];
    }else{
        //showText:@"您还未安装微信~"
    }
}

@end

@implementation WeChatPushModel



@end
