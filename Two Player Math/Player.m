//
//  Player.m
//  Two Player Math
//
//  Created by Tenzin Phagdol on 2016-03-14.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import "Player.h"

@implementation Player

//initialize players with 3 health
-(instancetype)init {
    self = [super init];
    if (self) {
        self.lifeTotal = 3;
    } return self;
}


@end
