//
//  Queue.h
//  TodescoNibbles2
//
//  Created by Eric Chown
//  Edited by Anthony Todesco on 4/30/13.
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "List.h"

@interface Queue : NSObject

@property (nonatomic, strong) List *queue;

- (id)init;
- (void)enqueue:(CGPoint)anObject;
- (CGPoint)dequeue;
- (void)clear;
- (int)size;
- (CGPoint)peek;
- (BOOL)isEmpty;

@end
