//
//  ListenModel.m
//  ScaApp
//
//  Created by Xiang on 16/5/16.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "ListenModel.h"
#import "MTModel+GGRequest.h"


@implementation ListenModel

+(void)getModelArrWithPage:(int)page success:(void (^)(id))finished{
    
    NSString *path = [@"sca60s?func=getlist&pagesize=15&page=" stringByAppendingFormat:@"%d",page];
    [self startRequestWithUrl:kUrl(path) complish:finished];
}

@end
