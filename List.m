//
//  List.m
//  TodescoNibbles2
//
//  Created by Eric Chown
//  Edited by Anthony Todesco on 4/30/13.
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import "List.h"

@implementation List

@synthesize tail = _tail;
@synthesize head = _head;
@synthesize count = _count;

- (id)init
{
    if (self = [super init]) {
        self.count = 0;
        self.head = NULL;
        self.tail = NULL;
    }
    return self;
}

- (void)addToHead:(CGPoint)point
{
    Node *temp = [[Node alloc] init];
    temp.data = point;
    temp.next = self.head;
    self.head = temp;
    if (self.count == 0) {
        self.tail = temp;
    }
    self.count++;
}

- (void)addToTail:(CGPoint)point
{
    Node *temp = [[Node alloc] init];
    temp.data = point;
    temp.next = nil;
    self.tail.next = temp;
    self.tail = temp;
    if (self.count == 0) {
        self.head = temp;
    }
    self.count++;
}

- (CGPoint)removeFromHead
{
    CGPoint point = self.head.data;
    if (self.count == 1) {
        self.tail = nil;
    }
    if (self.count > 0) {
        self.count--;
    }
    self.head = self.head.next;
    return point;
}

- (CGPoint)removeFromTail
{
    CGPoint temp = self.tail.data;
    Node *finger = self.head;
    while (finger.next.next) {
        finger = finger.next;
    }
    self.tail = finger;
    self.tail.next = nil;
    if (self.count > 0) {
        self.count--;
    }
    return temp;
}

- (CGPoint)getHeadData
{
    return self.head.data;
}

- (CGPoint)getTailData
{
    return self.tail.data;
}

- (void)clear
{
    self.head = nil;
    self.tail = nil;
    self.count = 0;
}

- (int)size
{
    return self.count;
}

- (BOOL)isEmpty
{
    return self.count == 0;
}


@end