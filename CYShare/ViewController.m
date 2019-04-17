//
//  ViewController.m
//  CYShare
//
//  Created by cxx on 2019/4/16.
//  Copyright © 2019年 分享. All rights reserved.
//

#import "ViewController.h"
#import "MYShare.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self initUI];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initUI
{
    UIButton *vy = [UIButton buttonWithType:UIButtonTypeCustom];
    vy.frame = CGRectMake(100, 100, 100, 100);
    vy.center = self.view.center;
    vy.backgroundColor = [UIColor yellowColor];
    [vy addTarget:self action:@selector(bacj) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:vy];
}
- (void)bacj
{
    [self shareWebpageObjectWeibo];
}


/* 新浪分享-网页类型 */
- (void)shareWebpageObjectWeibo
{
    WeiBoPushModel *model = [WeiBoPushModel new];
    model.content = @"是的发送到发发发呆";
    model.maxImage = [UIImage imageNamed:@"ss.jpeg"];
    model.webpageUrl = @"http://www.cocoachina.com/bbs/read.php?tid=1711152";
    [MYWeibo shareWebpageObjectWeibo:model];
}

/* 新浪分享-图片加文字类型 */
- (void)shareImageObjectWeibo
{
    WeiBoPushModel *model = [WeiBoPushModel new];
    model.content = @"是的发送到发发发呆";
    model.maxImage = [UIImage imageNamed:@"ss.jpeg"];
    [MYWeibo shareImageObjectWeibo:model];
}
/* 新浪分享-文字类型 */
- (void)shareMessageWeibo
{
    WeiBoPushModel *model = [WeiBoPushModel new];
    model.content = @"是的发送到发发发呆";
    [MYWeibo shareMessageWeiboContent:model];
}


/* 腾讯 QQ分享-新闻类型 */
- (void)shareNewsObjectQQ:(int)QQScene
{
    TencentOpenQQPushModel *model = [TencentOpenQQPushModel new];
    model.webpageUrl = @"";
    model.content = @"sdfsadfaffdaf";
    model.userName = @"标题";
    model.maxImageUrl = @"https://pics5.baidu.com/feed/b3fb43166d224f4a577303e7dc7238569a22d1e2.jpeg?token=1a7198b1dee4d5d4829a4eb7e5c37623&s=C112549ADE176BEB0AEF9D460300F0BB";
    model.maxImageInt = 0;
    model.maxImage = [UIImage imageNamed:@"ss.jpeg"];
    [MYTencentOpenQQ shareNewsObjectQQ:QQScene shareContent:model];
}




/* 腾讯 QQ分享-纯图片类型 */
- (void)shareImageObjectQQ:(int)QQScene
{
    TencentOpenQQPushModel *model = [TencentOpenQQPushModel new];
    model.content = @"sdfsadfaffdaf";
    model.userName = @"标题";
    model.maxImageUrl = @"https://pics5.baidu.com/feed/b3fb43166d224f4a577303e7dc7238569a22d1e2.jpeg?token=1a7198b1dee4d5d4829a4eb7e5c37623&s=C112549ADE176BEB0AEF9D460300F0BB";
    model.maxImageInt = 1;
    model.maxImage = [UIImage imageNamed:@"ss.jpeg"];
    [MYTencentOpenQQ shareImageObjectQQ:QQScene shareContent:model];
}


/* 腾讯 QQ分享-纯文本类型 */
- (void)shareMessageQQ:(int)QQScene
{
    TencentOpenQQPushModel *model = [TencentOpenQQPushModel new];
    model.content = @"sdfsadfaffdaf";
    [MYTencentOpenQQ shareTextMessageQQ:QQScene shareContent:model];
}



/* 微信分享-网页类型 */
- (void)shareWebpageObjectWeChat:(int)wxScene
{
    WeChatPushModel *model = [WeChatPushModel new];
    model.thumbimage = [UIImage imageNamed:@"ss.jpeg"];
    model.webpageUrl = @"https://open.weixin.qq.com";
    model.userName = @"标题";
    model.content = @"描述";
    [MYWeChat shareWebpageObjectWeChat:WXSceneSession shareContent:model];
}

/* 微信分享-图片类型 */
- (void)shareImageObjectWeChat:(int)wxScene
{
    UIImage *image = [UIImage imageNamed:@"ss.jpeg"];
    WeChatPushModel *model = [WeChatPushModel new];
    model.maxImage = image;
    [MYWeChat shareImageObjectWeChat:wxScene shareContent:model];
}

/* 微信分享-文字类型 */
- (void)shareMessageWeChat:(int)wxScene
{
    WeChatPushModel *model = [WeChatPushModel new];
    model.content = @"舒适的方式发到";
    [MYWeChat shareMessageWeChat:wxScene shareContent:model];
}

/* 拉起的微信小程序 */
- (void)pullUpWeChatApplet
{
    WeChatPushModel *model = [WeChatPushModel new];
    model.userName = @"";
    model.path = @"";
    model.miniType = WXMiniProgramTypeRelease;
    [MYWeChat pullUpWeChatApplet:model];
}

@end
