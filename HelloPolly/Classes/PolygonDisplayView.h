//
//  PolygonDisplayView.h
//  HelloPolly
//
//  Created by Cosmin Stejerean on 3/10/10.
//  Copyright 2010 Cosmin Stejerean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface PolygonDisplayView : UIView {
    int numberOfSides;
    IBOutlet UILabel *nameLabel;
}

@property int numberOfSides;

- (void) setName: (NSString *)newName;

@end
