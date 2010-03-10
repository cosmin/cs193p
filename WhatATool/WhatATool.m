#import <Foundation/Foundation.h>

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

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    PrintPathInfo();
    PrintProcessInfo();
    PrintBookmarkInfo();
    PrintIntrospectionInfo();
    
    [pool drain];
    return 0;
}

