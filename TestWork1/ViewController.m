//
//  ViewController.m
//  TestWork1
//
//  Created by HZJ on 15/7/7.
//  Copyright (c) 2015年 HZJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
{
    NSURL *url;
}
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    url=[NSURL URLWithString:@"http://qm.qq.com/cgi-bin/qm/qr?k=W90WUTtcKFQ4g-u_eyLc_rHEQnmFdl2T#"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)addQQGroupB:(id)sender {
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    UIWebView *web=[[UIWebView alloc]initWithFrame:CGRectZero];
    web.delegate=self;
    [web loadRequest:request];
    [self.view addSubview:web];
}
- (IBAction)addQQGroup:(id)sender {
    _statusLabel.text=@"直接跳转";
    [[UIApplication sharedApplication]openURL:url];
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"start");
    _statusLabel.text=@"开始请求跳转协议";
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    if ([webView.request.URL.description hasPrefix:@"mqqapi:"]) {
       
    }else{
        NSLog(@"finish");
        _statusLabel.text=@"请求跳转协议完成";
    }
    
    //
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if ([request.URL.description hasPrefix:@"mqqapi:"]) {
        NSLog(@"jump");
        _statusLabel.text=@"即将跳转";
        [webView removeFromSuperview];
    }
    return YES;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [webView removeFromSuperview];
    NSLog(@"fail");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
