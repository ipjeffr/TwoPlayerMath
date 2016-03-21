//
//  Game Controller.h
//  Two Player Math
//
//  Created by Tenzin Phagdol on 2016-03-14.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;

@interface GameController : NSObject

@property int sum;
@property int playerInput;
@property Player *player1;
@property Player *player2;
@property BOOL playerTurn;

-(void)updateLifeTotal;
-(void)switchPlayer;
-(void)resetSum;
-(NSString *)storeNumberInput:(int)number;
-(NSString *)generateSumProblem;
-(NSString *)playerTurnDisplay;
-(NSString *)player1Score;
-(NSString *)player2Score;
-(NSString *)updateGameStatus;


@end
