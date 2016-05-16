//
//  ListenModel.h
//  ScaApp
//
//  Created by Xiang on 16/5/16.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface ListenModel : MTLModel <MTLJSONSerializing>

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *mp3;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *create;



+(void)getModelArrWithPage:(int)page success:(void(^)(id))finished;

@end
