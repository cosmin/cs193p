//
//  PolygonDisplayView.m
//  HelloPolly
//
//  Created by Cosmin Stejerean on 3/10/10.
//  Copyright 2010 Cosmin Stejerean. All rights reserved.
//

#import "PolygonDisplayView.h"


@implementation PolygonDisplayView

@synthesize numberOfSides;

- (void) setNumberOfSides: (int) newNumberOfSides {
    numberOfSides = newNumberOfSides;
    [self setNeedsDisplay];
}

- (void) setName: (NSString *)newName {
    nameLabel.text = newName;
}

- (NSMutableArray *) pointsForPolygonInRect:(CGRect)rect {
    CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
    float radius = 0.9 * center.x;
    NSMutableArray *result = [NSMutableArray array];
    float angle = (2.0 * M_PI) / numberOfSides;
    float exteriorAngle = M_PI - angle;
    float rotationDelta = angle - (0.5 * exteriorAngle);
    
    for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) {
        float newAngle = (angle * currentAngle) - rotationDelta;
        float curX = cos(newAngle) * radius;
        float curY = sin(newAngle) * radius;
        [result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, center.y + curY)]];
    }
    
    return result;
}

- (void) drawRect:(CGRect)rect {
    NSMutableArray *points = [self pointsForPolygonInRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, 0, (rect.size.height - rect.size.width) / 2.0);
    
    CGContextBeginPath (context);
    CGPoint startingPoint = [((NSValue*)[points objectAtIndex:0]) CGPointValue];
    CGContextMoveToPoint(context, startingPoint.x, startingPoint.y);
    
    [points removeObjectAtIndex:0];
    for (NSValue *value in points) {
        CGPoint point = [value CGPointValue];
        CGContextAddLineToPoint(context, point.x, point.y);
    }
    
    CGContextClosePath(context);
    
    [[UIColor redColor] setFill]; 
    [[UIColor blackColor] setStroke]; 
    CGContextDrawPath (context, kCGPathFillStroke);
}

@end
