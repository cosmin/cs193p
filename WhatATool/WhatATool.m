#import <Foundation/Foundation.h>
#import "PolygonShape.h"

#define YES_NO(X) (X ? @"YES" : @"NO")

void PrintPathInfo() {
    NSString *path = @"~";
    path = [path stringByExpandingTildeInPath];
    NSLog(@"My home folder is at '%@'", path);
    for(NSString *component in [path pathComponents]) {
        NSLog(@"%@", component);
    }
}

void PrintProcessInfo() {
    NSProcessInfo *processInfo = [NSProcessInfo processInfo];
    NSString *processName = [processInfo processName];
    int pid = [processInfo processIdentifier];
    NSLog(@"Process Name: '%@' Process ID: '%d'", processName, pid);
}

void PrintBookmarkInfo() {
    NSMutableDictionary *bookmarks = [NSMutableDictionary dictionaryWithCapacity:5];
    [bookmarks setValue:[NSURL URLWithString:@"http://www.stanford.edu"] forKey:@"Stanford University"];
    [bookmarks setValue:[NSURL URLWithString:@"http://www.apple.com"] forKey:@"Apple"];
    [bookmarks setValue:[NSURL URLWithString:@"http://cs193p.stanford.edu"] forKey:@"CS193P"];
    [bookmarks setValue:[NSURL URLWithString:@"http://itunes.stanford.edu"] forKey:@"Stanford on iTunes U"];
    [bookmarks setValue:[NSURL URLWithString:@"http://stanfordshop.com"] forKey:@"Stanford Mall"];
    
    for(NSString *key in bookmarks) {
        if ([key hasPrefix:@"Stanford"]) {
            NSLog(@"Key: '%@' URL: '%@'", key, [bookmarks objectForKey:key]);
        }
    }
}

void PrintIntrospectionInfo() {
    NSMutableArray *objects = [NSMutableArray arrayWithCapacity:6];
    [objects addObject:@"some string"];
    [objects addObject:[NSURL URLWithString:@"http://google.com"]];
    [objects addObject:[NSProcessInfo processInfo]];
    [objects addObject:[NSDictionary dictionary]];
    [objects addObject:[NSMutableString stringWithFormat:@"%@ %@", @"Cosmin", @"Stejerean"]];
    [objects addObject:[NSString stringWithFormat:@"%d years", 24]];

    
    for(id object in objects) {
        NSLog(@"Class name: %@", [object className]);
        NSLog(@"Is Member of NSString: %@", YES_NO([object isMemberOfClass:[NSString class]]));
        NSLog(@"Is Kind of NSString: %@", YES_NO([object isKindOfClass:[NSString class]]));
        NSLog(@"Responds to lowercaseString: %@", YES_NO([object respondsToSelector:@selector(lowercaseString)]));
        NSLog(@"==================================");
    }
}

void PrintPolygonInfo() {
    NSMutableArray *polygons = [[NSMutableArray alloc] initWithCapacity:3];

    PolygonShape *poly1 = [[PolygonShape alloc] initWithNumberOfSides:4 minimumNumberOfSides:3 maximumNumberOfSides:7];
    NSLog(@"Created %@", poly1);
    [polygons addObject:poly1];
    [poly1 release];
    poly1 = nil;
    
    PolygonShape *poly2 = [[PolygonShape alloc] initWithNumberOfSides:6 minimumNumberOfSides:5 maximumNumberOfSides:9];
    NSLog(@"Created %@", poly2);
    [polygons addObject:poly2];
    [poly2 release];
    poly2 = nil;
    
    PolygonShape *poly3 = [[PolygonShape alloc] initWithNumberOfSides:12 minimumNumberOfSides:9 maximumNumberOfSides:12];
    NSLog(@"Created %@", poly3);
    [polygons addObject:poly3];
    [poly3 release];
    poly3 = nil;
    
    for (PolygonShape *poly in polygons) {
        NSLog(@"Contains: %@", poly);
    }
    [polygons release];
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    PrintPathInfo();            // Section 1
    PrintProcessInfo();         // Section 2
    PrintBookmarkInfo();        // Section 3
    PrintIntrospectionInfo();   // Section 4
    PrintPolygonInfo();         // Section 6 (No function for section 5)
    
    [pool drain];
    return 0;
}

