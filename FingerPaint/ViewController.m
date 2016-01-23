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
@property (strong, nonatomic) IBOutlet UIView *colorView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.paintView.pathColor = [UIColor colorWithHue:0.5 saturation:1.0 brightness:1.0 alpha:1.0];
    self.colorView.backgroundColor = self.paintView.pathColor;
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
    }
    [self.paintView setNeedsDisplay];

}
- (IBAction)colorSlider:(UISlider *)sender {
    self.paintView.pathColor = [UIColor colorWithHue:sender.value saturation:1.0 brightness:1.0 alpha:1.0];
    self.colorView.backgroundColor = [UIColor colorWithHue:sender.value saturation:1.0 brightness:1.0 alpha:1.0];
//    NSLog(@"value %f", sender.value);
}
- (IBAction)clearButton:(UIButton *)sender {
    [self.paintView.arrayOfPaths removeAllObjects];
    [self.paintView setNeedsDisplay];
}

@end
