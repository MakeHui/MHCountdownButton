//
//  MHCountdownButton.m
//  MHCountdownButton
//
//  Created by MakeHui on 2018/4/10.
//  Copyright © 2018年 MakeHui. All rights reserved.
//

#import "MHCountdownButton.h"

@interface MHCountdownButton()
{
    NSTimer *_timer;
    NSUInteger _count;
}

@end

@implementation MHCountdownButton

- (void)setDuration:(NSUInteger)duration
{
    _duration = duration + 1;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _autoRunning = true;
        _count = 0;
        _runingText = @"倒计时 %ld 秒";
        _runingColor = [UIColor lightGrayColor];
        _finishedText = @"点击重新倒计时";
        _finishedColor = [[self titleLabel] textColor];
        
        [self addTarget:self action:@selector(onTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (IBAction)onTouchUpInside:(UIButton *)sender
{
    if (!self.autoRunning) {
        return;
    }
    
    [self stopCountdown];
    
    if (_count == self.duration) {
        _count = 0;
    }

    [self continueCountdown];
}

- (void)restartCountdown
{
    [self stopCountdown];
    
    _count = 0;
    
    [self continueCountdown];
}

- (void)continueCountdown
{
    self.enabled = false;

    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats:true];
    
    if([self.delegate respondsToSelector:@selector(countdownButtonDidBegin:)]) {
        [self.delegate countdownButtonDidBegin:self];
    }
    
    [self updateCountdown];
}

- (void)stopCountdown
{
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    
    if([self.delegate respondsToSelector:@selector(countdownButtonDidStop:)]) {
        [self.delegate countdownButtonDidStop:self];
    }
}

- (void)finishedCountdown
{
    [self setEnabled:true];
    [self stopCountdown];
    
    [self setTitleColor:_finishedColor forState:UIControlStateNormal];
    [self setTitle:_finishedText forState:UIControlStateNormal];
    
    if([self.delegate respondsToSelector:@selector(countdownButtonDidFinished:)]) {
        [self.delegate countdownButtonDidFinished:self];
    }
}

- (void)updateCountdown
{
    _count += 1;
    NSUInteger counting = self.duration - _count;
    
    [self setTitleColor:_runingColor forState:UIControlStateNormal];
    [self setTitle:[NSString stringWithFormat:_runingText, counting] forState:UIControlStateNormal];
    
    if([self.delegate respondsToSelector:@selector(countdownButton:didRunningAtCounting:)]) {
        [self.delegate countdownButton:self didRunningAtCounting:counting];
    }
    
    if (self.duration <= _count) {
        [self finishedCountdown];
    }
}

- (BOOL)isRunning
{
    return !self.enabled;
}


@end
