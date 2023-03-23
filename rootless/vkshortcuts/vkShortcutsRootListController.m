#include "vkShortcutsRootListController.h"
#import <spawn.h>

@interface NSTask : NSObject
@property(copy)NSArray* arguments;
@property(copy)NSString* launchPath;
- (void)launch;
@end

@implementation vkShortcutsRootListController

- (NSArray *)specifiers {
	
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];

		UIBarButtonItem *respringBtn = [[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStylePlain target:self action:@selector(respring)];
        [[self navigationItem] setRightBarButtonItem:respringBtn animated:YES];
        [respringBtn release];
	}

	return _specifiers;
}

- (void)respring{
    NSTask* task = [[NSTask alloc] init];
    [task setLaunchPath:@"/var/jb/usr/bin/killall"];
    [task setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
    [task launch];
}

- (void)github {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/Lizynz/vkShortcuts"] options:@{} completionHandler:nil];
}

- (void)telegram {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://t.me/Helper_iOS"] options:@{} completionHandler:nil];
}

- (void)twitter {
     if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=Lizynz1"] options:@{} completionHandler:nil];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://mobile.twitter.com/Lizynz1"] options:@{} completionHandler:nil];
    }
}

@end
