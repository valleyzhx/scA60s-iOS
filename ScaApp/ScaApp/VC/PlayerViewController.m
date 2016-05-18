//
//  PlayerViewController.m
//  ScaApp
//
//  Created by Xiang on 16/5/17.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "PlayerViewController.h"
#import "BaseViewController+NaviView.h"



@interface PlayerViewController ()

@end

@implementation PlayerViewController{
    UITextView *_textView;
    UIButton *_playBtn;
    CMTime _playTime;
}

- (void)viewDidLoad {
    self.noTable = YES;
    [super viewDidLoad];
    
    UIView *textBackView = [[UIView alloc]init];
    textBackView.backgroundColor = [UIColor whiteColor];
    
    _textView = [[UITextView alloc]init];
    [self.view addSubview:textBackView];
    [self.view addSubview:_textView];
    _textView.font = [UIFont systemFontOfSize:15];
    _textView.editable = NO;
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-100);
    }];
    [textBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(_textView);
        make.bottom.equalTo(_textView).offset(10);
    }];
    
    
    NSString *text = _model.content;
    NSError *error;
    // 创建NSRegularExpression对象并指定正则表达式
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:@"\\s+"
                                  options:0
                                  error:&error];
    if (!error) { // 如果没有错误
        // 获取特特定字符串的范围
        NSTextCheckingResult *match = [regex firstMatchInString:text
                                                        options:0
                                                          range:NSMakeRange(0, [text length])];
        if (match) {
            // 截获特定的字符串
            text = [text stringByReplacingCharactersInRange:match.range withString:@" "];
        }
    } else { // 如果有错误，则把错误打印出来
        NSLog(@"error - %@", error);
    }
    
    

    _textView.text = text;
    
    
    _playBtn = [[UIButton alloc]init];
    [self.view addSubview:_playBtn];
    [_playBtn addTarget:self action:@selector(clickedPlayAction:) forControlEvents:UIControlEventTouchUpInside];
    [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-30);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [_playBtn setImage:[UIImage imageNamed:@"pause-icon"] forState:UIControlStateNormal];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clickedPlayAction:(UIButton*)btn{
    if ((_dreamPlayer.player.rate != 0) && (_dreamPlayer.player.error == nil)) {
        // player is playing
        _playTime = [_dreamPlayer.player currentTime];
        [_dreamPlayer.player pause];
        [_playBtn setImage:[UIImage imageNamed:@"play-icon.png"] forState:UIControlStateNormal];
    }else{
        [_dreamPlayer.player seekToTime:_playTime];
        [_dreamPlayer.player play];
        [_playBtn setImage:[UIImage imageNamed:@"pause-icon.png"] forState:UIControlStateNormal];
    }
}

@end
