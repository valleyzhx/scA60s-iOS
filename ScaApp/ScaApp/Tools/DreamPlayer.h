//
//  DreamPlayer.h
//  ScaApp
//
//  Created by Xiang on 16/5/17.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface DreamPlayer : NSObject

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) NSString *currentName;

+(id)dreamPlayer;

-(void)playAudio:(NSURL*)url;

@end
