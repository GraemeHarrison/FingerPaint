//
//  Line.m
//  FingerPaint
//
//  Created by Graeme Harrison on 2016-01-22.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "Line.h"

@implementation Line

- (instancetype)init
{
    self = [super init];
    if (self) {
        _linesArray = [[NSMutableArray alloc]init];
        _color = [[UIColor alloc]init];
    }
    return self;
}

@end
