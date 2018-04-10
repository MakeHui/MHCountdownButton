//
//  ViewController.m
//  MHCountdownButtonExample
//
//  Created by MakeHui on 2018/4/10.
//  Copyright © 2018年 MakeHui. All rights reserved.
//

#import "ViewController.h"
#import "MHCountdownButton.h"

@interface ViewController ()<MHCountdownButtonDelegate>

@property (weak, nonatomic) IBOutlet MHCountdownButton *beginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.beginButton.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onStopTouchUpInside:(UIButton *)sender {
    [self.beginButton stopCountdown];
}

- (IBAction)onContinueTouchUpInside:(UIButton *)sender {
    [self.beginButton continueCountdown];
}

- (IBAction)onRestartTouchUpInside:(UIButton *)sender {
    [self.beginButton restartCountdown];
}

#pragma mark - MHCountdownButtonDelegate

-(void)countdownButtonDidBegin:(MHCountdownButton *)button
{
    if (button == self.beginButton) {
        NSLog(@"%s --> isRunning: %@", __func__, button.isRunning ? @"isRunning" : @"notRunning");
    }
}

-(void)countdownButton:(MHCountdownButton *)button didRunningAtCounting:(NSUInteger)counting
{
    if (button == self.beginButton) {
        NSLog(@"%s --> counting: %ld --> isRunning: %@", __func__, counting, button.isRunning ? @"isRunning" : @"notRunning");
    }
}

-(void)countdownButtonDidFinished:(MHCountdownButton *)button
{
    if (button == self.beginButton) {
        NSLog(@"%s --> isRunning: %@", __func__, button.isRunning ? @"isRunning" : @"notRunning");
    }
}

@end
