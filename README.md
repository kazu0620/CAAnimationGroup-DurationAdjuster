#CAAnimationGroup-DurationAdjuster
CAAnimationGroup Category that make animation group be sequential.

##Examples
---------
```objc
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
```
See the demo project for more examples, or http://qiita.com/kazu0620/items/d152d7376e4f83e21a4b

##Setup Instructions
Install with [CocoaPods](http://cocoapods.org) by adding the following to your Podfile:

``` ruby
platform :ios, '6.0'
pod 'CAAnimationGroup-DurationAdjuster', '~> 0.0.1'
```

or add manually: 

Add `CAAnimationGroup-DurationAdjuster.h` & `CAAnimationGroup-DurationAdjuster.m` to your project.
