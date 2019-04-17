//
//  MYTencentOpenQQ.m
//  WebDome
//
//  Created by cxx on 2019/4/11.
//  Copyright © 2019年 陈诗友. All rights reserved.
//

#import "MYTencentOpenQQ.h"

@implementation MYTencentOpenQQ

/* 腾讯 QQ分享-新闻类型 */
/*  @param QQOrZone 0 ->QQ ,1 -->zone */
+ (void)shareNewsObjectQQ:(int)QQOrZone
              shareContent:(TencentOpenQQPushModel *)model
{
    NSString *utf8String = model.webpageUrl;
    NSString *title = model.userName;
    NSString *description = model.content;
    NSString *previewImageUrl = model.maxImageUrl;
    NSData *imageData = [NSData data];
    
    QQApiNewsObject *newsObj;
    if (model.maxImageInt == 0) {//分享图片链接
        newsObj = [QQApiNewsObject
                   objectWithURL:[NSURL URLWithString:utf8String]
                   title:title
                   description:description
                   previewImageURL:[NSURL URLWithString:previewImageUrl]];
    }else{//分享图片data
        if (model.maxImage) {
            imageData = UIImageJPEGRepresentation(model.maxImage, 0.7);
            newsObj = [QQApiNewsObject
                       objectWithURL:[NSURL URLWithString:utf8String]
                       title:title
                       description:description
                       previewImageData:imageData];
        }
    }

    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:newsObj];
    
    if (QQOrZone == 0) {
        //qq
        QQApiSendResultCode sent = [QQApiInterface sendReq:req];
        [self handleSendResult:sent];
    }else{
        //zone
        QQApiSendResultCode sent = [QQApiInterface SendReqToQZone:req];
        [self handleSendResult:sent];
    }
}

/* 腾讯 QQ分享-纯图片类型 */
/*  @param QQOrZone 0 ->QQ ,1 -->zone */
+ (void)shareImageObjectQQ:(int)QQOrZone
              shareContent:(TencentOpenQQPushModel *)model
{
  
    //initWithPreviewImageURL
    QQApiImageObject *imgObj;
    if (model.maxImage) {
        NSData *imgData = [NSData data];
        imgData = UIImageJPEGRepresentation(model.maxImage, 0.7);
        imgObj = [QQApiImageObject objectWithData:imgData
                                 previewImageData:imgData
                                            title:model.userName
                                      description:model.content];
    }
    
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:imgObj];
    
    if (QQOrZone == 0) {
        //qq
        QQApiSendResultCode sent = [QQApiInterface sendReq:req];
        [self handleSendResult:sent];
    }else{
        //zone
        QQApiSendResultCode sent = [QQApiInterface SendReqToQZone:req];
        [self handleSendResult:sent];
    }
}



/* 腾讯 QQ分享-纯文本类型 */
/*  @param QQOrZone 0 ->QQ ,1 -->zone */
+ (void)shareTextMessageQQ:(int)QQOrZone
               shareContent:(TencentOpenQQPushModel *)model
{
    QQApiTextObject *txtObj = [QQApiTextObject objectWithText:model.content];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:txtObj];
    
    if (QQOrZone == 0) {
        //qq
        QQApiSendResultCode sent = [QQApiInterface sendReq:req];
        [self handleSendResult:sent];
    }else{
        //zone
        QQApiSendResultCode sent = [QQApiInterface SendReqToQZone:req];
        [self handleSendResult:sent];
    }
}


+ (void)handleSendResult:(QQApiSendResultCode)sendResult
{
    switch (sendResult)
    {
        case EQQAPIAPPNOTREGISTED:
        {
//            [appDelegate showAlertViewWithTitle:@"Error" message:@"App未注册" cancelBtnTitle:@"取消" cancelBlock:nil confirmBtnTitle:nil confirmBlock:nil];
            break;
        }
        case EQQAPIMESSAGECONTENTINVALID:
        case EQQAPIMESSAGECONTENTNULL:
        case EQQAPIMESSAGETYPEINVALID:
        {
//            [appDelegate showAlertViewWithTitle:@"Error" message:@"发送参数错误" cancelBtnTitle:@"取消" cancelBlock:nil confirmBtnTitle:nil confirmBlock:nil];
            break;
        }
        case EQQAPIQQNOTINSTALLED:
        {
//            [appDelegate showAlertViewWithTitle:@"Error" message:@"未安装手Q" cancelBtnTitle:@"取消" cancelBlock:nil confirmBtnTitle:nil confirmBlock:nil];
            break;
        }
        case EQQAPIQQNOTSUPPORTAPI:
        {
//            [appDelegate showAlertViewWithTitle:@"Error" message:@"API接口不支持" cancelBtnTitle:@"取消" cancelBlock:nil confirmBtnTitle:nil confirmBlock:nil];
            break;
        }
        case EQQAPISENDFAILD:
        {
//            [appDelegate showAlertViewWithTitle:@"Error" message:@"发送失败" cancelBtnTitle:@"取消" cancelBlock:nil confirmBtnTitle:nil confirmBlock:nil];
            break;
        }
        default:
        {
            break;
        }
    }
}

@end


@implementation TencentOpenQQPushModel



@end
