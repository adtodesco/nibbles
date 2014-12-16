//
//  List.h
//  TodescoNibbles2
//
//  Created by Eric Chown
//  Edited by Anthony Todesco on 4/30/13.
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface List : NSObject

@property (nonatomic, strong) Node *head;
@property (nonatomic, strong) Node *tail;
@property int count;

- (void)addToHead:(CGPoint)point;
- (void)addToTail:(CGPoint)point;
- (CGPoint)removeFromHead;
- (CGPoint)removeFromTail;
- (void) clear;
- (int) size;
- (CGPoint) getHeadData;
- (CGPoint) getTailData;
- (BOOL)isEmpty;

@end
