//
//  PlayerViewController.h
//  ScaApp
//
//  Created by Xiang on 16/5/17.
//  Copyright © 2016年 iDreams. All rights reserved.
//

#import "BaseViewController.h"
#import "ListenModel.h"
#import "DreamPlayer.h"

@interface PlayerViewController : BaseViewController

@property (nonatomic,strong) ListenModel *model;
@property (nonatomic,assign) DreamPlayer *dreamPlayer;


@end
