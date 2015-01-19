//
//  CAAnimationGroup+DurationAdjuster.h
//  CatTown
//
//  Created by sakamoto kazuhiro on 2014/01/22.
//  Copyright (c) 2014年 soragoto. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAAnimationGroup(DurationAdjuster)

- (void) setDurationToSequentially;
- (void) setDurationToSameTimeSpawn;

@end
