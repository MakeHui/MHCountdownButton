//
//  MHCountdownButton.h
//  MHCountdownButton
//
//  Created by MakeHui on 2018/4/10.
//  Copyright © 2018年 MakeHui. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for MHCountdownButton.
FOUNDATION_EXPORT double MHCountdownButtonVersionNumber;

//! Project version string for MHCountdownButton.
FOUNDATION_EXPORT const unsigned char MHCountdownButtonVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <MHCountdownButton/PublicHeader.h>

@protocol MHCountdownButtonDelegate;


@interface MHCountdownButton : UIButton

@property(nonatomic, assign) id<MHCountdownButtonDelegate> delegate;

@property(nonatomic, assign)IBInspectable NSUInteger duration;

@property(nonatomic, strong)IBInspectable UIColor *runingColor;

@property(nonatomic, strong)IBInspectable NSString *runingText;

@property(nonatomic, strong)IBInspectable UIColor *finishedColor;

@property(nonatomic, strong)IBInspectable NSString *finishedText;

- (void)continueCountdown;

- (void)restartCountdown;

- (void)stopCountdown;

- (BOOL)isRunning;

@end


@protocol MHCountdownButtonDelegate<NSObject>

@optional

- (void)countdownButtonDidBegin:(MHCountdownButton *)button;

- (void)countdownButton:(MHCountdownButton *)button didRunningAtCounting:(NSUInteger)counting;

- (void)countdownButtonDidStop:(MHCountdownButton *)button;

- (void)countdownButtonDidFinished:(MHCountdownButton *)button;

@end

