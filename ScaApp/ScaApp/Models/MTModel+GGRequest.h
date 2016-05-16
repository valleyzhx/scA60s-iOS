//
//  MTModel+GGRequest.h
//  MyDota
//
//  Created by Xiang on 15/10/18.
//  Copyright © 2015年 iOGG. All rights reserved.
//

#import <Mantle.h>

@interface MTLModel (GGRequest)
+(void)startRequestWithUrl:(NSString *)url complish:(void (^)(id))finished;

@end