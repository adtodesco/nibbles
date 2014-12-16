//
//  Environment.m
//  TodescoNibbles2
//
//  Created by Anthony Todesco on 4/25/13.
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import "Environment.h"

@implementation Environment

// Initialyze Environment
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

// DrawRect contains the custom drawing code for the environment
// It sets up a grid and sets a boarder around it
// It displays the food and the snake

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    int fieldWidth = COLS;
    int fieldHeight = ROWS;
    
    CGPoint temp;
    CGRect boarder = CGRectMake(FIELDINSET, FIELDINSET, COLS * CELLSIZE, ROWS * CELLSIZE);
    CGContextSetLineWidth(context, 3.0);
    CGContextStrokeRect(context, boarder);

    for (int i = 0; i < fieldWidth; i++) {
        for (int j = 0; j < fieldHeight; j++) {
            int x = FIELDINSET + i * CELLSIZE;
            int y = FIELDINSET + j * CELLSIZE;
            CGRect rectangle = CGRectMake(x,y,CELLSIZE,CELLSIZE);
            temp.x = i;
            temp.y = j;
            int item = [self.delegate contentsOfEnvironment:self atPoint:temp];
            
            if (item == FOOD) {
                CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
                CGContextFillRect(context, rectangle);
            }
            else if (item == SNAKE) {
                CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 1.0);
                CGContextFillRect(context, rectangle);
            }
        }
    }
    
}



@end
