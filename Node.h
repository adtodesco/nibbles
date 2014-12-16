//
//  Node.h
//  TodescoNibbles2
//
//  Created by Eric Chown
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (nonatomic) CGPoint data;
@property (nonatomic, strong) Node *next;

@end
