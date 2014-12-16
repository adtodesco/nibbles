//
//  Environment.h
//  TodescoNibbles2
//
//  Created by Anthony Todesco on 4/25/13.
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@class Environment;

@protocol EnvironmentDelegate
- (int)contentsOfEnvironment:(Environment *)requestor
                     atPoint:(CGPoint)point;
@end

// Setting up Environment as a delegate of ViewController
@interface Environment : UIView {
    id <EnvironmentDelegate> delgate;
}

@property (nonatomic) id <EnvironmentDelegate> delegate;

@end
