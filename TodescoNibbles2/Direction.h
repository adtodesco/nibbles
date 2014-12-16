//
//  Direction.h
//  TodescoNibbles2
//
//  Created by Anthony Todesco on 4/30/13.
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Direction : NSObject

- (id)initWithX:(int)x y:(int)y; // Designated Initializer
- (void)setDirection:(CGPoint)point; // Point is updated
- (CGPoint)getDirection;
- (BOOL)isOpposite:(CGPoint)dir; // E.g. 0,1 and 0,-1

@property CGPoint currentDirection;

@end
