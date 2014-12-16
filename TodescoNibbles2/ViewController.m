//
//  ViewController.m
//  TodescoNibbles2
//
//  Created by Anthony Todesco on 4/25/13.
//  Copyright (c) 2013 Anthony Todesco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize environmentView = _environmentView;
@synthesize theWorld = _theWorld;
@synthesize snake = _snake;
@synthesize direction = _direction;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.environmentView.delegate = self;
    // Sets Environment as delegate
    [self.view setNeedsDisplay];
    // Displays the environmentView
    
    self.theWorld = [[World alloc] initWithWidth:COLS height:ROWS];
    self.direction = [[Direction alloc] initWithX:0 y:1];
    self.snake = [[Snake alloc] initAtPoint:[self.theWorld getCenter] withSize:3 growthRate:2 world:self.theWorld direction:self.direction];
    // Sets intances of the classes
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(refresh) userInfo:nil repeats:YES];
    // Creates a timer to call the refresh method
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Provides a method for environment to check what is in each space of the grid
// The view controller gets the information from the world
- (int)contentsOfEnvironment:(Environment *)requestor
                     atPoint:(CGPoint)point {
    
    if ([self.theWorld containsFoodAtPoint:point] == true) {
        return FOOD;
    }
    else if ([self.theWorld containsSnakeAtPoint:point] == true) {
        return SNAKE;
    }
    return EMPTY;
}

// Updates movement of the snake and redisplays
- (void)refresh{
    if ([self.snake gameOver] == true) {
        [self.timer invalidate];
    }
    else {
        [self.snake move];
        [self.environmentView setNeedsDisplay];
    }
}

// Four buttons that set the direction of the snake
- (IBAction)directionUp:(UIButton *)sender {
    [self.direction setDirection:CGPointMake(0, -1)];
    
}

- (IBAction)directionDown:(UIButton *)sender {
    [self.direction setDirection:CGPointMake(0, 1)];

}

- (IBAction)directionLeft:(UIButton *)sender {
    [self.direction setDirection:CGPointMake(-1, 0)];

}

- (IBAction)directionRight:(UIButton *)sender {
    [self.direction setDirection:CGPointMake(1, 0)];

}

// Starts a new game for the user
- (IBAction)newGame:(UIButton *)sender {
    
    [self.timer invalidate];
    
    self.environmentView.delegate = self;
    [self.view setNeedsDisplay];
    
    self.theWorld = [[World alloc] initWithWidth:COLS height:ROWS];
    self.direction = [[Direction alloc] initWithX:0 y:1];
    self.snake = [[Snake alloc] initAtPoint:[self.theWorld getCenter] withSize:3 growthRate:2 world:self.theWorld direction:self.direction];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(refresh) userInfo:nil repeats:YES];
    
}

@end
