//
//  Controller.h
//
//  Created by Cosmin Stejerean on 3/10/10.
//  Copyright 2010 Cosmin Stejerean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonDisplayView.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
    IBOutlet PolygonShape *polygon;
    IBOutlet PolygonDisplayView *polygonView;
}
- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;
@end
