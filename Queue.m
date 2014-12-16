//
//  Queue.m
//  TodescoNibbles2
//
//  Created by Eric Chown
//  Edited by Anthony Todesco on 4/30/13.
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import "Queue.h"

@implementation Queue

@synthesize queue = _queue;

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (id)queue
{
    if (!_queue) _queue = [[List alloc] init];
    return _queue;
}

- (void)enqueue:(CGPoint)point
{
    [self.queue addToHead:point];
}

- (CGPoint)dequeue
{
    return [self.queue removeFromTail];
}

- (void)clear
{
    [self.queue clear];
}

- (int)size
{
    return [self.queue size];
}

- (CGPoint)peek
{
    return [self.queue getHeadData];
}

- (BOOL)isEmpty
{
    return [self.queue isEmpty];
}

@end

