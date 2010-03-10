//
//  Controller.m
//
//  Created by Cosmin Stejerean on 3/10/10.
//  Copyright 2010 Cosmin Stejerean. All rights reserved.
//

#import "Controller.h"

@implementation Controller

- (void) updateInterface {
    numberOfSidesLabel.text = [[NSNumber numberWithInt:polygon.numberOfSides] stringValue];
    increaseButton.enabled = !(polygon.numberOfSides == polygon.maximumNumberOfSides);
    decreaseButton.enabled = !(polygon.numberOfSides == polygon.minimumNumberOfSides);
}

- (IBAction)decrease:(id)sender {
    polygon.numberOfSides -= 1;
    [self updateInterface];
}

- (IBAction)increase:(id)sender {
    polygon.numberOfSides += 1;
    [self updateInterface];
}

- (void)awakeFromNib {
    polygon.numberOfSides = numberOfSidesLabel.text.integerValue;
    NSLog(@"My polygon: %@", polygon);
    [self updateInterface];
}
@end
