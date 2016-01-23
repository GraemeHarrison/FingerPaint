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
//        _pathColor = [UIColor blackColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
//    NSLog(@"finger position: %@", NSStringFromCGPoint(self.fingerPosition));
    
    // Most recent line
    UIBezierPath *segmentPath = [[UIBezierPath alloc] init];
    if (self.fingerPath.count > 0) {
        CGPoint prevPoint = [[self.fingerPath objectAtIndex:0] CGPointValue];
        [segmentPath moveToPoint:prevPoint];
        
        for (NSValue *val in self.fingerPath) {
            CGPoint points = [val CGPointValue];
            [segmentPath addLineToPoint:points];
        }
      
        [self.pathColor setStroke];
        segmentPath.lineWidth = 4;
        [segmentPath stroke];
    }
    
    // Redrawing old lines
    if (self.arrayOfPaths.count > 0) {
        
        // Setting colors of previously drawn lines
        if (self.colorsArray.count > 0) {
            for (int i=0; i < self.arrayOfPaths.count; i++) {
                [[self.colorsArray objectAtIndex:i] setStroke];
            }
        }
        
        UIBezierPath *segmentPath = [[UIBezierPath alloc] init];
        for (NSArray *pathArray in self.arrayOfPaths) {
            if (pathArray.count > 0) {
                CGPoint prevPoint = [[pathArray objectAtIndex:0] CGPointValue];
                [segmentPath moveToPoint:prevPoint];
                
                for (NSValue *val in pathArray) {
                    CGPoint points = [val CGPointValue];
                    [segmentPath addLineToPoint:points];
                }
               
                segmentPath.lineWidth = 4;
                [segmentPath stroke];
            }
        }
    }
}

-(void)addPositions:(CGPoint)position {
    [self.fingerPath addObject:[NSValue valueWithCGPoint:position]];
}

-(void)storeArrays {
    [self.arrayOfPaths addObject:[self.fingerPath mutableCopy]];
    [self.colorsArray addObject:self.pathColor];
}

@end
