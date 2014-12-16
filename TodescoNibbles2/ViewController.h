//
//  ViewController.h
//  TodescoNibbles2
//
//  Created by Anthony Todesco on 4/25/13.
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import "Constants.h"
#import "Environment.h"
#import "World.h"
#import "Snake.h"
#import "Direction.h"
#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <EnvironmentDelegate> {
    __weak IBOutlet Environment *environmentView;
}

- (void)refresh;
- (IBAction)directionUp:(UIButton *)sender;
- (IBAction)directionDown:(UIButton *)sender;
- (IBAction)directionLeft:(UIButton *)sender;
- (IBAction)directionRight:(UIButton *)sender;
- (IBAction)newGame:(UIButton *)sender;

@property (nonatomic) IBOutlet Environment *environmentView;
@property (nonatomic, strong) World *theWorld;
@property (nonatomic, strong) Snake *snake;
@property (nonatomic) Direction *direction;
@property (nonatomic) NSTimer *timer;

@end
