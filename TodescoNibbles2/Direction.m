//
//  Direction.m
//  TodescoNibbles2
//
//  Created by Anthony Todesco on 4/30/13.
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import "Direction.h"

@implementation Direction

// Initialyzes direction
- (id)initWithX:(int)x y:(int)y {
    if (self = [super init]) {
        self.currentDirection = CGPointMake(x, y);
    }
    return self;
}

// Allows for ViewController buttons to set the direction
- (void)setDirection:(CGPoint)point {
    if ([self isOpposite:point] == false) {
        self.currentDirection = point;
    }
    
}

// Returns current direction to caller
- (CGPoint)getDirection {
    return self.currentDirection;
}

// Checks to see if the requested direction is opposite of the
// current direction
- (BOOL)isOpposite:(CGPoint)dir {
    if (dir.x == 0) {
        if (dir.y == -self.currentDirection.y) {
            return true;
        }
    }
    else {
        if (dir.x == -self.currentDirection.x) {
            return true;
        }
    }

    return false;
}

@end
