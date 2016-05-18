//
//  ListenModel.h
//  ScaApp
//
//  Created by Xiang on 16/5/16.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "ZXModel.h"

@interface ListenModel : ZXModel

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *create;
@property (nonatomic,strong) NSString *mp3;


+(void)getModelArrWithPage:(int)page success:(void(^)(id))finished;

@end
