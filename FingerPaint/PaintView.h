//
//  PaintView.h
//  FingerPaint
//
//  Created by Graeme Harrison on 2016-01-22.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface PaintView : UIView

@property (assign, nonatomic) IBInspectable CGPoint fingerPosition;
@property (assign, nonatomic) IBInspectable CGPoint startPosition;
@property (nonatomic,strong) NSMutableArray *fingerPath;
@property (nonatomic, strong) NSMutableArray *arrayOfPaths;
@property (nonatomic, assign) CGFloat fingerPathX;
@property (nonatomic, assign) CGFloat fingerPathY;
@property (nonatomic, assign) CGFloat startX;
@property (nonatomic, assign) CGFloat startY;

-(void)addPositions:(CGPoint)position;
-(void)storeArrays;

@end
