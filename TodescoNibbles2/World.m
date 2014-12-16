//
//  World.m
//  TodescoNibbles2
//
//  Created by Anthony Todesco on 4/28/13.
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import "World.h"

@implementation World

// Initialyzes the world, places food
- (id)initWithWidth:(int)w height:(int)h
{
    if (self = [super init]) {
        self.width = w;
        self.height = h;
        self.grid = [[NSMutableArray alloc] initWithCapacity:self.width];
        for (int i = 0; i < self.width; i++) {
            NSMutableArray *temp = [[NSMutableArray alloc] initWithCapacity:self.height];
            for (int j = 0; j < self.height; j++) {
                [temp addObject:[NSNumber numberWithInt:EMPTY]];
            }
            [self.grid addObject:temp];
        }
    }
    [self placeFood];
    return self;
}

// Places a piece of food at a random spot in the grid
- (void)placeFood {
    
    NSInteger randomX;
    NSInteger randomY;

    while (1) {
        randomX = arc4random() %COLS;
        randomY = arc4random() %ROWS;
        CGPoint foodPoint = CGPointMake(randomX, randomY);
        if ([self containsSnakeAtPoint:foodPoint] == false) {
            break;
        }
    }
    
    self.grid[randomX][randomY] = [NSNumber numberWithInt:FOOD];

}

// Returns the center spot of the grid
- (CGPoint)getCenter {
    CGPoint mid;
    mid.x = self.width / 2;
    mid.y = self.height / 2;
    return mid;
}

// Allows for snake class to place snake at a point
- (void)placeSnakeAtPoint:(CGPoint)point{
    
    int xCoor = (int) point.x;
    int yCoor = (int) point.y;
    self.grid[xCoor][yCoor] = [NSNumber numberWithInt:SNAKE];
    
}

// Checks if a point contains food
- (BOOL)containsFoodAtPoint:(CGPoint)point{
    
    int xCoor = (int) point.x;
    int yCoor = (int) point.y;
    
    if([self.grid[xCoor][yCoor] isEqual: [NSNumber numberWithInt:FOOD]]){
        return true;
    }
    
    return false;
}

// Checks if a point contains snake
- (BOOL)containsSnakeAtPoint:(CGPoint)point {
    
    int xCoor = (int) point.x;
    int yCoor = (int) point.y;
    
    if([self.grid[xCoor][yCoor] isEqual: [NSNumber numberWithInt:SNAKE]]){
        return true;
    }
    
    return false;
}

// Checks if a point is out of bounds
- (BOOL)outOfBoundsAtPoint:(CGPoint)point {
    
    if (point.x < 0 || point.x >= ROWS || point.y < 0 || point.y >= COLS) {
        return true;
    }
    
    return false;
}

// Clears a point from the grid
- (void)clearPoint:(CGPoint)point {
    
    int xCoor = (int) point.x;
    int yCoor = (int) point.y;
    self.grid[xCoor][yCoor] = [NSNumber numberWithInt:EMPTY];
    
}

@end
