//
//  ViewController.m
//  CAAnimationGroup-DurationAdjuster
//
//  Created by Kazuhiro Sakamoto on 2015/01/20.
//  Copyright (c) 2015年 Soragoto. All rights reserved.
//

#import "ViewController.h"
#import "CAAnimationGroup+DurationAdjuster.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [self _playAnimation];
    [super viewDidLoad];
}

- (void) _playAnimation {
    // create square view for animaton
    UIView *redSquare = [[UIView alloc]
                         initWithFrame:
                         CGRectMake(100,300,50,50)
                         ];
    redSquare.backgroundColor = [UIColor redColor];
    [self.view addSubview:redSquare];
    
    // bundle animations in a group
    CAAnimationGroup *animations = [CAAnimationGroup animation];
    animations.animations = @[
                              [self appearAnimation],
                              [self moveAnimation],
                              [self disappearAnimation]
                              ];
    // make animations sequential(adjust beginTime, duration)
    [animations setDurationToSequentially];
    
    // execute animation
    [redSquare.layer addAnimation:animations forKey:@"AnimationSample"];
}

- (CAAnimationGroup *) appearAnimation {
    // fadeIn animation
    CABasicAnimation* fadeIn = [CABasicAnimation
                                animationWithKeyPath:@"opacity"
                                ];
    fadeIn.fromValue = @0;
    fadeIn.toValue   = @1;
    fadeIn.duration  = 1.5;
    
    // zoom animation
    CABasicAnimation *zoomIn= [CABasicAnimation
                               animationWithKeyPath:@"transform.scale"
                               ];
    zoomIn.duration    = 1.5;
    zoomIn.fromValue = [NSNumber numberWithFloat:1.0];
    zoomIn.toValue   = [NSNumber numberWithFloat:2.0];
    
    // bundle animations in a group
    CAAnimationGroup *appear = [CAAnimationGroup animation];
    appear.animations = @[
                          fadeIn,
                          zoomIn,
                          ];
    
    // set gruoup duration for play same timing in this method
    [appear setDurationToSameTimeSpawn];
    
    return appear;
}

- (CAAnimationGroup *) moveAnimation {
    // move animation(to bottom)
    CABasicAnimation *moveToBottom = [CABasicAnimation
                                      animationWithKeyPath:@"position.y"
                                      ];
    moveToBottom.duration = 1.5;
    moveToBottom.byValue  = @(100.0f);
    
    // move animation(to right)
    CABasicAnimation *moveToRight = [CABasicAnimation
                                     animationWithKeyPath:@"position.x"
                                     ];
    moveToRight.duration = 1.5;
    moveToRight.byValue  = @(100.0f);
    
    // bundle animations in a group
    CAAnimationGroup *move = [CAAnimationGroup animation];
    move.animations = @[
                        moveToBottom,
                        moveToRight,
                        ];
    
    // make animations sequential(adjust beginTime, duration)
    [move setDurationToSequentially];
    
    return move;
}

- (CAAnimationGroup *) disappearAnimation {
    // fadeout animation
    CABasicAnimation* fadeOut = [CABasicAnimation
                                 animationWithKeyPath:@"opacity"
                                 ];
    fadeOut.fromValue = @0;
    fadeOut.toValue   = @1;
    fadeOut.duration  = 1.5;
    
    // zoom animation
    CABasicAnimation *zoomOut = [CABasicAnimation
                                 animationWithKeyPath:@"transform.scale"
                                 ];
    zoomOut.duration  = 1.5;
    zoomOut.fromValue = [NSNumber numberWithFloat:2.0];
    zoomOut.toValue   = [NSNumber numberWithFloat:0.0];
    
    // disappear animation
    CAAnimationGroup *disappear = [CAAnimationGroup animation];
    disappear.animations = @[
                             fadeOut,
                             zoomOut,
                             ];
    // set gruoup duration for play same timing in this method
    [disappear setDurationToSameTimeSpawn];
    
    return disappear;
}

@end
