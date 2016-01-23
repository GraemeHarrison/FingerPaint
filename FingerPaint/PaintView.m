//
//  PaintView.m
//  FingerPaint
//
//  Created by Graeme Harrison on 2016-01-22.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "PaintView.h"

@implementation PaintView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _fingerPath = [[NSMutableArray alloc] init];
        _arrayOfPaths = [[NSMutableArray alloc]init];
        _colorsArray = [[NSMutableArray alloc] init];
//        _line = [[Line alloc]init];
        _pathColor = [[UIColor alloc]init];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
//    NSLog(@"finger position: %@", NSStringFromCGPoint(self.fingerPosition));
    
    // Redrawing old lines
    if (self.arrayOfPaths.count > 0) {
        for (Line *lines in self.arrayOfPaths) {
            UIBezierPath *oldPath = [[UIBezierPath alloc] init];
            
            if (lines.linesArray.count > 0) {
                
                for (NSArray *points in lines.linesArray) {
                    CGPoint prevPoint = [[points objectAtIndex:0] CGPointValue];
                    [oldPath moveToPoint:prevPoint];
                    
                    for (NSValue *val in points) {
                        CGPoint points = [val CGPointValue];
                        [oldPath addLineToPoint:points];
                    }
                }
                [lines.color setStroke];
                oldPath.lineWidth = 4;
                [oldPath stroke];
            }
        }
    }
    
    // Most recent line
    UIBezierPath *newPath = [[UIBezierPath alloc] init];
    if (self.fingerPath.count > 0) {
        CGPoint prevPoint = [[self.fingerPath objectAtIndex:0] CGPointValue];
        [newPath moveToPoint:prevPoint];
        
        for (NSValue *val in self.fingerPath) {
            CGPoint points = [val CGPointValue];
            [newPath addLineToPoint:points];
        }
        [self.pathColor setStroke];
        newPath.lineWidth = 4;
        [newPath stroke];
    }
}

-(void)addPositions:(CGPoint)position {
    [self.fingerPath addObject:[NSValue valueWithCGPoint:position]];
}

-(void)storeArrays {
    Line *line = [[Line alloc] init];
    line.color = self.pathColor;
    [line.linesArray addObject:[self.fingerPath mutableCopy]];
    [self.arrayOfPaths addObject:line];
}

@end



//    [self.colorsArray addObject:newLine.color];
//    [self.arrayOfPaths addObject:[self.fingerPath mutableCopy]];
//    [self.colorsArray addObject:self.pathColor];


//        // Setting colors of previously drawn lines
//        if (self.colorsArray.count > 0) {
//            for (int i=0; i < self.arrayOfPaths.count; i++) {
//                [[self.colorsArray objectAtIndex:i] setStroke];
//            }
//        }
