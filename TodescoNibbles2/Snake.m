//
//  Snake.m
//  TodescoNibbles2
//
//  Created by Anthony Todesco on 4/30/13.
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import "Snake.h"

@implementation Snake

// Initialyzes the snake
- (id) initAtPoint:(CGPoint)point withSize:(int)size growthRate:(int)rate world:(World *)newWorld direction:(Direction *)dir {
    if (self = [super init]) {
        self.headPoint = point;
        self.size = size;
        self.rate = rate - 1;
        self.theWorld = newWorld;
        self.direction = dir;
        self.gameOver = false;
        self.stretchCount = 0;
        self.snakeQueue = [[Queue alloc] init];
        [self snakeStarter:point];
    }
    return self;
}

// Takes in the size parameter and creates a snake of that size
- (void)snakeStarter:(CGPoint)initialPoint {
    int count = self.size;
    while (count > 0) {
        [self.snakeQueue enqueue:CGPointMake(initialPoint.x, initialPoint.y - count)];
        [self.theWorld placeSnakeAtPoint:CGPointMake(initialPoint.x, initialPoint.y - count)];
        count--;
    }
}

// The method called by refresh in ViewController
// Checks if the next move will be legal
// If legal it performs the necessary operations (stretch, turn, etc.)
// If illegal it shrinks the snake and then ends the game
- (void) move {
    CGPoint currentDirection = [self.direction getDirection];
    CGPoint head = [self headPoint];
    
    if (self.stretchCount < 0) {
        [self shrink];
        self.stretchCount++;
        if (self.stretchCount == 0) {
            self.gameOver = true;
        }
    }
    
    else if(currentDirection.x == 0) {
        //DOWN
        if (currentDirection.y == 1) {
            CGPoint moveTo = CGPointMake(head.x, head.y + 1);
            if ([self.theWorld outOfBoundsAtPoint:moveTo]||[self.theWorld containsSnakeAtPoint:moveTo]) {
                self.stretchCount = -self.size;
            }
            else if ([self.theWorld containsFoodAtPoint:moveTo]) {
                [self stretch:moveTo];
                [self.theWorld placeFood];
                self.stretchCount = self.stretchCount + self.rate;
                self.size++;
            }
            else if (self.stretchCount > 0) {
                [self stretch:moveTo];
                self.stretchCount--;
                self.size++;
            }
            else {
                [self stretch:moveTo];
                [self shrink];
            }
        }
        //UP
        else {
            CGPoint moveTo = CGPointMake(head.x, head.y - 1);
            if ([self.theWorld outOfBoundsAtPoint:moveTo]||[self.theWorld containsSnakeAtPoint:moveTo]) {
                self.stretchCount = -self.size;
            }
            else if ([self.theWorld containsFoodAtPoint:moveTo]) {
                [self stretch:moveTo];
                [self.theWorld placeFood];
                self.stretchCount = self.stretchCount + self.rate;
                self.size++;
            }
            else if (self.stretchCount > 0) {
                [self stretch:moveTo];
                self.stretchCount--;
                self.size++;
            }
            else {
                [self stretch:moveTo];
                [self shrink];
            }
        }
        
    }
    else {
        //RIGHT
        if(currentDirection.x == 1) {
            CGPoint moveTo = CGPointMake(head.x + 1, head.y);
            if ([self.theWorld outOfBoundsAtPoint:moveTo]||[self.theWorld containsSnakeAtPoint:moveTo]) {
                self.stretchCount = -self.size;
            }
            else if ([self.theWorld containsFoodAtPoint:moveTo]) {
                [self stretch:moveTo];
                [self.theWorld placeFood];
                self.stretchCount = self.stretchCount + self.rate;
                self.size++;
            }
            else if (self.stretchCount > 0) {
                [self stretch:moveTo];
                self.stretchCount--;
                self.size++;
            }
            else {
                [self stretch:moveTo];
                [self shrink];
            }
        }
        //LEFT
        else {
            CGPoint moveTo = CGPointMake(head.x - 1, head.y);
            if ([self.theWorld outOfBoundsAtPoint:moveTo]||[self.theWorld containsSnakeAtPoint:moveTo]) {
                self.stretchCount = -self.size;
            }
            else if ([self.theWorld containsFoodAtPoint:moveTo]) {
                [self stretch:moveTo];
                [self.theWorld placeFood];
                self.stretchCount = self.stretchCount + self.rate;
                self.size++;
            }
            else if (self.stretchCount > 0) {
                [self stretch:moveTo];
                self.stretchCount--;
                self.size++;
            }
            else {
                [self stretch:moveTo];
                [self shrink];
            }
        }
        
    }
    
}

// Shrinks the snake by one at the end
- (void) shrink {
    CGPoint point = [self.snakeQueue dequeue];
    [self.theWorld clearPoint:point];
}

// Stretches the snake by one at the beginning
- (void) stretch:(CGPoint)point{
    [self.theWorld placeSnakeAtPoint:point];
    [self.snakeQueue enqueue:point];
}

// Returns the CGPoint of the snake head
- (CGPoint)headPoint {
    return [self.snakeQueue peek];
}


@end
