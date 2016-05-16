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

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{};
}


+(void)getModelArrWithPage:(int)page success:(void (^)(id))finished{
    NSString *url = [@"http://www.idreams.club/sca60s?func=getlist&pagesize=15&page=" stringByAppendingFormat:@"%d",page];
    [self startRequestWithUrl:url complish:finished];
}

@end
