//
//  ViewController.m
//  Alipay
//
//  Created by apple on 2017/2/23.
//  Copyright © 2017年 TG. All rights reserved.
//

#import "ViewController.h"
#import "Order.h"
#import "RSADataSigner.h"
//#import "
#import <AlipaySDK/AlipaySDK.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self doAlipayPay];
}
//
//选中商品调用支付宝极简支付
//
- (void)doAlipayPay
{
    //重要说明
    //这里只是为了方便直接向商户展示支付宝的整个支付流程；所以Demo中加签过程直接放在客户端完成；
    //真实App里，privateKey等数据严禁放在客户端，加签过程务必要放在服务端完成；
    //防止商户私密数据泄露，造成不必要的资金损失，及面临各种安全风险；
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *appID = @"2017022305839369";
    
    // 如下私钥，rsa2PrivateKey 或者 rsaPrivateKey 只需要填入一个
    // 如果商户两个都设置了，优先使用 rsa2PrivateKey
    // rsa2PrivateKey 可以保证商户交易在更加安全的环境下进行，建议使用 rsa2PrivateKey
    // 获取 rsa2PrivateKey，建议使用支付宝提供的公私钥生成工具生成，
    // 工具地址：https://doc.open.alipay.com/docs/doc.htm?treeId=291&articleId=106097&docType=1
    NSString *rsa2PrivateKey = @"MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQClZ4gSVkqAUxePLdu6+y0aQQCpQXDndNtjVhFGHtffhXiSnqMSFberwOq+6HgoM8ApYNqJvJLy9DrOKq+Ll7WzqM5c/O2GJcHyPPyPByJkQ9RvbjRcBE8ZIQnxYDbflztzzfHBKidz+iYzCNUBjwM2VbufTgfQj1V7HVmX2T8/RlU7wyyi2rSaq+yfuVjcE6+zUwyf38sNY5oQMGYQet30iDmnN/xn9VFU9uJFFvmLmzY7FKITIcrKYC5zs+T773yDaRU5YLyj66wz0mSoHwBXT7ylgEIIv0sshH+wE9i5M+epAlFSpU7cCqutm3DEOcgUgD5EoItPCZdM1xF+48FhAgMBAAECggEAchPFtV/uYjLsvMNUGNHDeaf7XMDVrczawthJcaM0H+VeE0F2FrMDymFzhdevh4qpreAu2XBFqWroY+jsycoId7ClI10ONMc1zGxjhAHXpm9hxLitRAl0xFAVG3TQY8VaK7SOWDtKmqKcVfZxcnHANWlLzcNzgFRbEF5dvG0JQgmRIxQ8ukMj37RqGTii6VzNfOVonZqoy7utvz6oziLw4ZCxT3eFnWrmCzSJmXql3+2XO/B1/4Tv4uFe/rSSFz09mHlREIeAwo1WCyIkKYRStbH79lugnoxCafOVfgn4Oja+b5dr0HPdaetk3EAdTrG6xZCjF3IeUodb4S4nHbezAQKBgQDuvwXc0SO5aQttLICd3GzO1z6IoUoCOfn9yd0mbU8p/JfmpI7MvyHty0ef2L467eiSpAwu1tUcqljFCSyxsI7K7kF0BAl+NW3C0ssaDO0ce5vRNwGEVZzZhjvOOIPferg8j1Zx+gqv54Q5IjQz3ks8Y93tHAcZFQfMSWoKULGAzQKBgQCxW6IJU2RYyaO0Yp9smfp7OGesTZYzihN339rcPvg8mN66UNDCEpNkUZ8xTrCmLfHCnlRg1wQBuPzMdng+X64lXKjjwgY5BzJJTAyNJUA6tJ6GKZTQCbGeBJW5EePxPvEnH1jkGrZ0A5vXLfJI3d9Eml4fRaijObP1vMbI8sGy5QKBgHSFwuS9JkRt4mfMWpGxbWGeaCTjI23mwf59sXP50bNaVwD4u8FuX67hkfmQHXhBeUtoyZFqxOSSt3SjP68Rzv94PXXUKpXwmbuGih4SxP8rzSbVQ+ZEqqL4AuRpbON7z8Ou6bADK4gi5MPFz9io2+uDimMZVNWHECFCi4CxVZDZAoGAIQV4k9fs9QMF8c3y9NtuYYbM9q2za4EnwsfxDdTDjzS/M11coOWof6MayqlmBmrDeoLUHvupiVCR8NeV57cUy2wHHfDAC9olKLR6GcV3wfZjFYOka1+CrHMaFU0ZbY9Ugv45JK88jTkmyNeLJrn4meNL5vKnRUy3DufI8x0Pp2kCgYEA5+GTPiWfk6m9QNFgEDN7HOzLG81jpGvEXzfH56I+ErZQ9/rYzLtvGwBW+XKmQxBqWedQuEed0aHq2klRQkS1Ja1GrAQVXyZeeyyWcjFNmciWv5IUcyq8IYXb8MM51xu5GPMaA9Wp6MgJZCQwLCN3ZOtXlVeikbQUqyn1gkahjHM=";
    NSString *rsaPrivateKey = @"";
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([appID length] == 0 ||
        ([rsa2PrivateKey length] == 0 && [rsaPrivateKey length] == 0))
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"缺少appId或者私钥。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order* order = [Order new];
    
    // NOTE: app_id设置
    order.app_id = appID;
    
    // NOTE: 支付接口名称
    order.method = @"alipay.trade.app.pay";
    
    // NOTE: 参数编码格式
    order.charset = @"utf-8";
    
    // NOTE: 当前时间点
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    order.timestamp = [formatter stringFromDate:[NSDate date]];
    
    // NOTE: 支付版本
    order.version = @"1.0";
    
    // NOTE: sign_type 根据商户设置的私钥来决定
    order.sign_type = (rsa2PrivateKey.length > 1)?@"RSA2":@"RSA";
    
    // NOTE: 商品数据
    order.biz_content = [BizContent new];
    order.biz_content.body = @"我是测试数据";
    order.biz_content.subject = @"1";
    order.biz_content.out_trade_no = @"201023239423u5u4554"; //订单ID（由商家自行制定）
    order.biz_content.timeout_express = @"30m"; //超时时间设置
    order.biz_content.total_amount = [NSString stringWithFormat:@"%.2f", 0.01]; //商品价格
    
    //将商品信息拼接成字符串
    NSString *orderInfo = [order orderInfoEncoded:NO];
    NSString *orderInfoEncoded = [order orderInfoEncoded:YES];
    NSLog(@"orderSpec = %@",orderInfo);
    
    // NOTE: 获取私钥并将商户信息签名，外部商户的加签过程请务必放在服务端，防止公私钥数据泄露；
    //       需要遵循RSA签名规范，并将签名字符串base64编码和UrlEncode
    NSString *signedString = nil;
    RSADataSigner* signer = [[RSADataSigner alloc] initWithPrivateKey:((rsa2PrivateKey.length > 1)?rsa2PrivateKey:rsaPrivateKey)];
    if ((rsa2PrivateKey.length > 1)) {
        signedString = [signer signString:orderInfo withRSA2:YES];
    } else {
        signedString = [signer signString:orderInfo withRSA2:NO];
    }
    
    // NOTE: 如果加签成功，则继续执行支付
    if (signedString != nil) {
        //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
        NSString *appScheme = @"alisdkdemo";
        
        // NOTE: 将签名成功字符串格式化为订单字符串,请严格按照该格式
        NSString *orderString = [NSString stringWithFormat:@"%@&sign=%@",
                                 orderInfoEncoded, signedString];
        
        // NOTE: 调用支付结果开始支付
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
        }];
    }
}
@end
