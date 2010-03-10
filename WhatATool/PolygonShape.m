#import "PolygonShape.h"

@implementation PolygonShape

- (id) init {
    return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
}

- (id) initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
    if (self = [super init]) {
        self.minimumNumberOfSides = min;
        self.maximumNumberOfSides = max;
        self.numberOfSides = sides;
    }
    return self;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"Hello I am a %d-sided polygon (aka a %@) with angles of %f degrees (%f radians).", self.numberOfSides, self.name, self.angleInDegrees, self.angleInRadians];
}

- (void) dealloc {
    NSLog(@"Calling dealloc on %@", self);
    [super dealloc];
}

- (void) setNumberOfSides:(int)number {
    NSAssert2(number >= minimumNumberOfSides, @"Invalid number of sides: %d is less than the minimum of %d allowed", number, minimumNumberOfSides);
    NSAssert2(number <= maximumNumberOfSides, @"Invalid number of sides: %d is greater than the maximum of %d allowed", number, maximumNumberOfSides);
    numberOfSides = number;
}

- (void) setMinimumNumberOfSides:(int) minimum {
    NSAssert2(minimum > 2, @"Invalid minimum number of sides: %d is less than the minimum of %d allowed", minimum, 3);
    minimumNumberOfSides = minimum;
}

- (void) setMaximumNumberOfSides:(int) maximum {
    NSAssert2(maximum <= 12, @"Invalid maximum number of sides: %d is greater than the maximum of %d allowed", maximum, 12);
    maximumNumberOfSides = maximum;
}

- (float) angleInDegrees {
    return (180.0 * (numberOfSides - 2) / numberOfSides);
}

- (float) angleInRadians {
    return self.angleInDegrees / 360 * 2 * M_PI;
}

- (NSString*) name {
    switch (self.numberOfSides) {
        case 3:
            return @"Triangle";
            break;
        case 4:
            return @"Square";
            break;
        case 5:
            return @"Pentagon";
            break;
        case 6:
            return @"Hexagon";
            break;
        case 7:
            return @"Heptagon";
            break;
        case 8:
            return @"Octagon";
            break;
        case 9:
            return @"Enneagon";
            break;
        case 10:
            return @"Decagon";
            break;
        case 11:
            return @"Hendecagon";
            break;
        case 12:
            return @"Dodecagon";
            break;
        default:
            return @"Unknown";
    }
}

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

@end
