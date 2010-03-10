//
//  Controller.h
//
//  Created by Cosmin Stejerean on 3/10/10.
//  Copyright 2010 Cosmin Stejerean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
    IBOutlet PolygonShape *polygon;
}
- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;
@end
