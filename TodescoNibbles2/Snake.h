//
//  Snake.h
//  TodescoNibbles2
//
//  Created by Anthony Todesco on 4/30/13.
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "World.h"
#import "Queue.h"
#import "Direction.h"
#import "Constants.h"

@interface Snake : NSObject

- (id) initAtPoint:(CGPoint)point
          withSize:(int)size
        growthRate:(int)rate
             world:(World *)newWorld
         direction:(Direction *)dir;
- (void) move;
- (void)stretch:(CGPoint)point;
- (void)shrink;
- (CGPoint)headPoint;
- (void)snakeStarter:(CGPoint)initialPoint;

@property (nonatomic) int size;
@property (nonatomic) int rate;
@property (nonatomic) int stretchCount;
@property (nonatomic) CGPoint headPoint;
@property (nonatomic) BOOL gameOver;

@property (nonatomic, strong) World *theWorld;
@property (nonatomic) Queue *snakeQueue;
@property (nonatomic) Direction *direction;

@end