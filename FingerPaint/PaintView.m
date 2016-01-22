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
        _fingerPoints = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"finger position: %@", NSStringFromCGPoint(self.fingerPosition));
    
    
    
    UIBezierPath *segmentPath = [[UIBezierPath alloc] init];

    if (self.fingerPath.count >0) {
        CGPoint prevPoint = [[self.fingerPath objectAtIndex:0] CGPointValue];
        [segmentPath moveToPoint:prevPoint];
        
        for (NSValue *val in self.fingerPath) {
            CGPoint points = [val CGPointValue];
            [segmentPath addLineToPoint:points];
            
        }
        
//        [segmentPath closePath];
        
//        [[UIColor blackColor] setFill];
//        [segmentPath fill];
        
        [[UIColor blackColor] setStroke];
        segmentPath.lineWidth = 4;
        [segmentPath stroke];
    }


}

-(void)addPositions:(CGPoint)position {
    [self.fingerPath addObject:[NSValue valueWithCGPoint:position]];
}


@end
