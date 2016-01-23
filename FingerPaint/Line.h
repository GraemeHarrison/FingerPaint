//
//  Line.h
//  FingerPaint
//
//  Created by Graeme Harrison on 2016-01-22.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Line : NSObject

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) NSMutableArray *linesArray; //array of points for each line

@end
