//
//  ViewController.m
//  FingerPaint
//
//  Created by Graeme Harrison on 2016-01-22.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "ViewController.h"
#import "PaintView.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet PaintView *paintView;
@property (strong, nonatomic) IBOutlet UIView *colorView;
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) IBOutlet UIButton *textButton;

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
    if (self.paintView.isTextOn == NO) {
        if (sender.state == UIGestureRecognizerStateEnded) {
            [self.paintView storeArrays];
            [self.paintView.fingerPath removeAllObjects];
        } else {
            CGPoint currentLocation = [sender locationInView:self.view];
            [self.paintView addPositions:currentLocation];
        }
    } else {

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
- (IBAction)textButton:(UIButton *)sender {
    if (self.paintView.isTextOn == NO) {
        self.paintView.isTextOn = YES;
        self.textButton.backgroundColor = [UIColor darkGrayColor];
    } else {
        self.paintView.isTextOn = NO;
        [self.textField resignFirstResponder];
        self.textButton.backgroundColor = [UIColor lightGrayColor];
    }
    
}
- (IBAction)eraserButton:(UIButton *)sender {
}

- (IBAction)textLocation:(UITapGestureRecognizer *)sender {
    if (self.paintView.isTextOn == YES) {
        CGPoint currentLocation = [sender locationInView:self.view];
        [self createTextField:currentLocation];
        [self.textField becomeFirstResponder];
    }
}

-(void)createTextField:(CGPoint)position {
    CGFloat locationX = position.x;
    CGFloat locationY = position.y;
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(locationX, locationY, 100, 40)];
    self.textField.borderStyle = UITextBorderStyleNone;
    self.textField.font = [UIFont systemFontOfSize:15.0f];
    self.textField.placeholder = @"";
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField.keyboardType = UIKeyboardTypeDefault;
    self.textField.returnKeyType = UIReturnKeyDone;
//    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
//    [self.textField release];
}

// Do stuff when done button on keyboard is pressed, eg. remove keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    self.paintView.isTextOn = NO;
    self.textButton.backgroundColor = [UIColor lightGrayColor];
    return NO;
}

// Expand text field according to content length
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    CGFloat textWidth = [newText sizeWithAttributes: @{NSFontAttributeName: [UIFont systemFontOfSize:15.0f]}].width;
    textWidth += 15;
    CGRect tFFrame = [textField frame];
    
    tFFrame.size.width = textWidth;
    textField.frame = tFFrame;
    
    [textField setNeedsDisplay];
    return YES;
}

@end
