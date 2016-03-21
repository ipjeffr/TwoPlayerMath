//
//  Game Controller.m
//  Two Player Math
//
//  Created by Tenzin Phagdol on 2016-03-14.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import "GameController.h"
#import "Player.h"

@implementation GameController

-(instancetype)init {
    self = [super init];
    if (self) {
        _player1 = [[Player alloc]init];
        _player2 = [[Player alloc]init];
        _playerTurn = NO; //NO = 0, i.e. player1 turn
    }return self;
}

#pragma mark - Generate Game Problem

-(NSString *)generateSumProblem
{
    int largest = 20;
    int smallest = 1;
    
    int random1 = smallest + arc4random() % (largest+1-smallest);
    int random2 = smallest + arc4random() % (largest+1-smallest);
    
    self.sum = random1 + random2; //stores sum or randoms in a global variable
    
    NSLog(@"%i + %i", random1, random2);
    
    return [NSString stringWithFormat: @"%i + %i", random1, random2];    
}

#pragma mark - Handle Player Input

-(NSString *)storeNumberInput:(int)number {
    self.playerInput = self.playerInput * 10 + number; //algorithm to, essentially, concatenate input
    return [NSString stringWithFormat:@"= %d", self.playerInput];
}

-(void)updateLifeTotal {
    
    if (self.playerInput == self.sum) {
        NSLog(@"correct answer");
    } else {
        if (self.playerTurn == NO) {
            self.player1.lifeTotal--;
        } else {
            self.player2.lifeTotal--;
        }
    }
}

//switch players, reset player input
-(void)switchPlayer {
    
    self.playerTurn = !self.playerTurn;
    self.playerInput = 0;
}

-(void)resetSum {
     self.sum = 0;
}

#pragma mark - Output Labels

-(NSString *)updateGameStatus {
    NSString *gameStatus;
    
    if (self.playerInput == self.sum) {
        gameStatus = @"Correct!";
    } else {
        gameStatus = @"Wrong!";
        if (self.playerTurn == NO) {
            if (self.player1.lifeTotal == 0) {
                gameStatus = @"Player 2 Wins!";
            }
        } else if (self.player2.lifeTotal == 0) {
            gameStatus = @"Player 1 Wins!";
        }
    }
    return gameStatus;
    
}


-(NSString *)playerTurnDisplay {
    NSString *playerTurn;
    
    if (self.playerTurn == NO) {
        playerTurn = @"Player 1";
    } else {
        playerTurn = @"Player 2";
    }
    
    return playerTurn;
}

-(NSString *)player1Score {
    NSString *p1Score = [NSString stringWithFormat:@"P1 Life: %i", self.player1.lifeTotal];
    return p1Score;
}

-(NSString *)player2Score {
    NSString *p2Score = [NSString stringWithFormat:@"P2 Life: %i", self.player2.lifeTotal];
    return p2Score;
}

@end
