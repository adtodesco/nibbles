//
//  World.h
//  TodescoNibbles2
//
//  Created by Anthony Todesco on 4/28/13.
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface World : NSObject

- (id)initWithWidth:(int)w height:(int)h; // Designated Initializer
- (void)placeFood; // Goes to an empty square
- (CGPoint)getCenter; // Center point of world

- (void)placeSnakeAtPoint:(CGPoint)point; // Called by “Snake” class
- (BOOL)containsFoodAtPoint:(CGPoint)point; // YES, if food is there
- (BOOL)containsSnakeAtPoint:(CGPoint)point; // YES, if Snake is there
- (BOOL)outOfBoundsAtPoint:(CGPoint)point; // Check legality of point
- (void)clearPoint:(CGPoint)point; // Remove any items/creature

@property (nonatomic) NSMutableArray *grid;
@property (nonatomic) int width;
@property (nonatomic) int height;

@end
