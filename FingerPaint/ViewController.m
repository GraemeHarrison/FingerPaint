//
//  ViewController.m
//  FingerPaint
//
//  Created by Graeme Harrison on 2016-01-22.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "ViewController.h"
#import "PaintView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet PaintView *paintView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)paintGesture:(UIPanGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self.paintView storeArrays];
        [self.paintView.fingerPath removeAllObjects];
    } else {
        CGPoint currentLocation = [sender locationInView:self.view];
        [self.paintView addPositions:currentLocation];
        [self.paintView setNeedsDisplay];
    }
}

@end


//    CGPoint startLocation = [sender locationOfTouch:1 inView:self.view];
////    CGFloat startX = startLocation.x;
////    CGFloat startY = startLocation.y;
////
////    CGFloat locationX = currentLocation.x;
////    CGFloat locationY = currentLocation.y;
////
////    self.paintView.startX = startX;
////    self.paintView.startX = startY;
////
////    self.paintView.fingerPathX = locationX;
////    self.paintView.fingerPathY = locationY;
//    self.paintView.startPosition = startLocation;
//    self.paintView.fingerPosition = currentLocation;
