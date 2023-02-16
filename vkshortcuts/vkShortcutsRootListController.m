#include "vkShortcutsRootListController.h"
#import <spawn.h>

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
    pid_t pid;
    int status;
    const char* args[] = { "killall", "-9", "SpringBoard", NULL };
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
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
