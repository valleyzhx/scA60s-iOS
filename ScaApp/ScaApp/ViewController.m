//
//  ViewController.m
//  ScaApp
//
//  Created by Xiang on 16/5/15.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL * URL = [NSURL URLWithString:@"http://127.0.0.1:3000/sca60s?func=getlist"];
    
    NSURLRequest * request = [[NSURLRequest alloc]initWithURL:URL];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        NSLog(@"error: %@",[error localizedDescription]);
    }else{
        NSLog(@"response : %@",response);
        NSLog(@"backData : %@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
