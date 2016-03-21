//
//  ViewController.m
//  Two Player Math
//
//  Created by Tenzin Phagdol on 2016-03-14.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *playerInputDisplay;
@property (weak, nonatomic) IBOutlet UILabel *statusOutput;
@property (weak, nonatomic) IBOutlet UILabel *player1LifeTotal;
@property (weak, nonatomic) IBOutlet UILabel *player2LifeTotal;
@property (weak, nonatomic) IBOutlet UILabel *problemOutput;

@end

@implementation ViewController
- (IBAction)enter:(id)sender {

    [self.gameController updateLifeTotal];
    self.statusOutput.text = [self.gameController updateGameStatus];
    
    self.player1LifeTotal.text = self.gameController.player1Score;
    self.player2LifeTotal.text = self.gameController.player2Score;
    
    [self.gameController switchPlayer];
    [self.gameController resetSum];
    NSString *newProblem = [self.gameController generateSumProblem];
    NSString *nextPlayer = [self.gameController playerTurnDisplay];
    self.problemOutput.text = [NSString stringWithFormat:@"%@:   %@", nextPlayer, newProblem];
    self.playerInputDisplay.text = @"= ";
}

- (IBAction)numberPress:(UIButton*)sender {
    int num = (int) sender.tag; //set interface builder tags to integers
    NSLog(@"%d", num);
    
    NSString *playerInputDisplay = [self.gameController storeNumberInput:num];
    self.playerInputDisplay.text = (@"%@", playerInputDisplay);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.gameController = [[GameController alloc] init];
    
    self.problemOutput.text =  [NSString stringWithFormat:@"%@:   %@", [self.gameController playerTurnDisplay], [self.gameController generateSumProblem]];
    self.player1LifeTotal.text = self.gameController.player1Score;
    self.player2LifeTotal.text = self.gameController.player2Score;
    self.playerInputDisplay.text = @"=";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
