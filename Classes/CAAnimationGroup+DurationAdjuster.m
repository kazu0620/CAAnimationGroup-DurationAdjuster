//
//  CAAnimationGroup+DurationAdjuster.m
//  CatTown
//
//  Created by sakamoto kazuhiro on 2014/01/22.
//  Copyright (c) 2014年 soragoto. All rights reserved.
//

#import "CAAnimationGroup+DurationAdjuster.h"

@implementation CAAnimationGroup(DurationAdjuster)

- (void) setDurationToSequentially {
    float summedDuration = 0;
    for ( CABasicAnimation *animation in self.animations ){
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [animation setBeginTime:summedDuration];
        summedDuration += [self _executeDurationWithAnimation:animation];
    }
    self.duration = summedDuration;
}

- (void) setDurationToSameTimeSpawn{
    float maxDurationLength = 0;
    for ( CABasicAnimation *animation in self.animations ){
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        float executeDuration = [self _executeDurationWithAnimation:animation];
        if( maxDurationLength < executeDuration ){
            maxDurationLength = executeDuration;
        }
    }
    self.duration = maxDurationLength;
}

- (float) _executeDurationWithAnimation:(CABasicAnimation *)animation {
    float executeDuration = animation.autoreverses ?
    animation.duration * 2 : animation.duration;
    if( animation.repeatCount ){
        executeDuration *= animation.repeatCount;
    }
    return executeDuration;
}


@end
