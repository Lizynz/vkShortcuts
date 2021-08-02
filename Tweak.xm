#import <substrate.h>

#define kRWSettingsPath @"/var/mobile/Library/Preferences/com.lizynz.vkshortcuts.plist"

static const NSBundle *tweakBundle = [NSBundle bundleWithPath:@"/Library/Application Support/vkShortcuts/Localizations.bundle"];
#define LOCALIZED(str) [tweakBundle localizedStringForKey:str value:@"" table:nil]

@interface SBIconView : NSObject
- (NSString *)applicationBundleIdentifierForShortcuts;
@end

@interface SBSApplicationShortcutItem : NSObject
- (void)setLocalizedTitle:(id)arg1;
- (void)setType:(id)arg1;
@end

@interface BSCFBundle : NSBundle
- (NSString *)bundleIdentifier;
@end

@interface SBApplicationInfo : NSBundle
- (id)staticApplicationShortcutItems;
@end

int ST1 = 1;
int ST2 = 1;
int ST3 = 1;
int ST4 = 1;

/*%hook SBApplicationInfo
- (id)staticApplicationShortcutItems {
    if ([self.bundleIdentifier isEqualToString:@"com.vk.vkclient"]) {
        return @[];
    } else {
        return %orig;
    }
}
%end*/

%hook SBIconView
- (NSArray *)applicationShortcutItems {

           NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:kRWSettingsPath];

           if (prefs) {

           ST1 = [prefs objectForKey:@"st1"] ? [[prefs objectForKey:@"st1"] intValue] : ST1;
           ST2 = [prefs objectForKey:@"st2"] ? [[prefs objectForKey:@"st2"] intValue] : ST2;
           ST3 = [prefs objectForKey:@"st3"] ? [[prefs objectForKey:@"st3"] intValue] : ST3;
           ST4 = [prefs objectForKey:@"st4"] ? [[prefs objectForKey:@"st4"] intValue] : ST4;

           }

           if ([self.applicationBundleIdentifierForShortcuts isEqualToString:@"com.vk.vkclient"]) {

           NSArray *applicationShortcutItems = %orig;
           NSMutableArray *mutableItems = [NSMutableArray arrayWithArray:applicationShortcutItems];

           if (ST1 == 1 || ST2 == 1 || ST3 == 1 || ST4 == 1) {} //Delete shortcuts

           if (ST1 == 3) {

           SBSApplicationShortcutItem *groupShortcut = [[SBSApplicationShortcutItem alloc] init];
           [groupShortcut setLocalizedTitle:LOCALIZED(@"groups")];
           [groupShortcut setType:@"groups"];
           [mutableItems addObject:groupShortcut];

           }

           if (ST1 == 4) {

           SBSApplicationShortcutItem *favoriteShortcut = [[SBSApplicationShortcutItem alloc] init];
           [favoriteShortcut setLocalizedTitle:LOCALIZED(@"favorite")];
           [favoriteShortcut setType:@"favorite"];
           [mutableItems addObject:favoriteShortcut];

           }

           if (ST1 == 5) {

           SBSApplicationShortcutItem *musicShortcut = [[SBSApplicationShortcutItem alloc] init];
           [musicShortcut setLocalizedTitle:LOCALIZED(@"music")];
           [musicShortcut setType:@"music"];
           [mutableItems addObject:musicShortcut];

           }

           if (ST1 == 6) {

           SBSApplicationShortcutItem *classifiedsShortcut = [[SBSApplicationShortcutItem alloc] init];
           [classifiedsShortcut setLocalizedTitle:LOCALIZED(@"classifieds")];
           [classifiedsShortcut setType:@"classifieds"];
           [mutableItems addObject:classifiedsShortcut];

           }

           if (ST1 == 7) {

           SBSApplicationShortcutItem *docsShortcut = [[SBSApplicationShortcutItem alloc] init];
           [docsShortcut setLocalizedTitle:LOCALIZED(@"docs")];
           [docsShortcut setType:@"docs"];
           [mutableItems addObject:docsShortcut];

           }

           if (ST1 == 9) {

           SBSApplicationShortcutItem *likedShortcut = [[SBSApplicationShortcutItem alloc] init];
           [likedShortcut setLocalizedTitle:LOCALIZED(@"liked")];
           [likedShortcut setType:@"liked"];
           [mutableItems addObject:likedShortcut];

           }

           if (ST1 == 11) {

           SBSApplicationShortcutItem *podcastsShortcut = [[SBSApplicationShortcutItem alloc] init];
           [podcastsShortcut setLocalizedTitle:LOCALIZED(@"podcasts")];
           [podcastsShortcut setType:@"podcasts"];
           [mutableItems addObject:podcastsShortcut];

           }

           if (ST2 == 3) {

           SBSApplicationShortcutItem *groupShortcut = [[SBSApplicationShortcutItem alloc] init];
           [groupShortcut setLocalizedTitle:LOCALIZED(@"groups")];
           [groupShortcut setType:@"groups"];
           [mutableItems addObject:groupShortcut];

           }

           if (ST2 == 4) {

           SBSApplicationShortcutItem *favoriteShortcut = [[SBSApplicationShortcutItem alloc] init];
           [favoriteShortcut setLocalizedTitle:LOCALIZED(@"favorite")];
           [favoriteShortcut setType:@"favorite"];
           [mutableItems addObject:favoriteShortcut];

           }

           if (ST2 == 5) {

           SBSApplicationShortcutItem *musicShortcut = [[SBSApplicationShortcutItem alloc] init];
           [musicShortcut setLocalizedTitle:LOCALIZED(@"music")];
           [musicShortcut setType:@"music"];
           [mutableItems addObject:musicShortcut];

           }

           if (ST2 == 6) {

           SBSApplicationShortcutItem *classifiedsShortcut = [[SBSApplicationShortcutItem alloc] init];
           [classifiedsShortcut setLocalizedTitle:LOCALIZED(@"classifieds")];
           [classifiedsShortcut setType:@"classifieds"];
           [mutableItems addObject:classifiedsShortcut];

           }

           if (ST2 == 7) {

           SBSApplicationShortcutItem *docsShortcut = [[SBSApplicationShortcutItem alloc] init];
           [docsShortcut setLocalizedTitle:LOCALIZED(@"docs")];
           [docsShortcut setType:@"docs"];
           [mutableItems addObject:docsShortcut];

           }

           if (ST2 == 9) {

           SBSApplicationShortcutItem *likedShortcut = [[SBSApplicationShortcutItem alloc] init];
           [likedShortcut setLocalizedTitle:LOCALIZED(@"liked")];
           [likedShortcut setType:@"liked"];
           [mutableItems addObject:likedShortcut];

           }

           if (ST2 == 11) {

           SBSApplicationShortcutItem *podcastsShortcut = [[SBSApplicationShortcutItem alloc] init];
           [podcastsShortcut setLocalizedTitle:LOCALIZED(@"podcasts")];
           [podcastsShortcut setType:@"podcasts"];
           [mutableItems addObject:podcastsShortcut];

           }

           if (ST3 == 3) {

           SBSApplicationShortcutItem *groupShortcut = [[SBSApplicationShortcutItem alloc] init];
           [groupShortcut setLocalizedTitle:LOCALIZED(@"groups")];
           [groupShortcut setType:@"groups"];
           [mutableItems addObject:groupShortcut];

           }

           if (ST3 == 4) {

           SBSApplicationShortcutItem *favoriteShortcut = [[SBSApplicationShortcutItem alloc] init];
           [favoriteShortcut setLocalizedTitle:LOCALIZED(@"favorite")];
           [favoriteShortcut setType:@"favorite"];
           [mutableItems addObject:favoriteShortcut];

           }

           if (ST3 == 5) {

           SBSApplicationShortcutItem *musicShortcut = [[SBSApplicationShortcutItem alloc] init];
           [musicShortcut setLocalizedTitle:LOCALIZED(@"music")];
           [musicShortcut setType:@"music"];
           [mutableItems addObject:musicShortcut];

           }

           if (ST3 == 6) {

           SBSApplicationShortcutItem *classifiedsShortcut = [[SBSApplicationShortcutItem alloc] init];
           [classifiedsShortcut setLocalizedTitle:LOCALIZED(@"classifieds")];
           [classifiedsShortcut setType:@"classifieds"];
           [mutableItems addObject:classifiedsShortcut];

           }

           if (ST3 == 7) {

           SBSApplicationShortcutItem *docsShortcut = [[SBSApplicationShortcutItem alloc] init];
           [docsShortcut setLocalizedTitle:LOCALIZED(@"docs")];
           [docsShortcut setType:@"docs"];
           [mutableItems addObject:docsShortcut];

           }

           if (ST3 == 9) {

           SBSApplicationShortcutItem *likedShortcut = [[SBSApplicationShortcutItem alloc] init];
           [likedShortcut setLocalizedTitle:LOCALIZED(@"liked")];
           [likedShortcut setType:@"liked"];
           [mutableItems addObject:likedShortcut];

           }

           if (ST3 == 11) {

           SBSApplicationShortcutItem *podcastsShortcut = [[SBSApplicationShortcutItem alloc] init];
           [podcastsShortcut setLocalizedTitle:LOCALIZED(@"podcasts")];
           [podcastsShortcut setType:@"podcasts"];
           [mutableItems addObject:podcastsShortcut];

           }

           if (ST4 == 3) {

           SBSApplicationShortcutItem *groupShortcut = [[SBSApplicationShortcutItem alloc] init];
           [groupShortcut setLocalizedTitle:LOCALIZED(@"groups")];
           [groupShortcut setType:@"groups"];
           [mutableItems addObject:groupShortcut];

           }

           if (ST4 == 4) {

           SBSApplicationShortcutItem *favoriteShortcut = [[SBSApplicationShortcutItem alloc] init];
           [favoriteShortcut setLocalizedTitle:LOCALIZED(@"favorite")];
           [favoriteShortcut setType:@"favorite"];
           [mutableItems addObject:favoriteShortcut];

           }

           if (ST4 == 5) {

           SBSApplicationShortcutItem *musicShortcut = [[SBSApplicationShortcutItem alloc] init];
           [musicShortcut setLocalizedTitle:LOCALIZED(@"music")];
           [musicShortcut setType:@"music"];
           [mutableItems addObject:musicShortcut];

           }

           if (ST4 == 6) {

           SBSApplicationShortcutItem *classifiedsShortcut = [[SBSApplicationShortcutItem alloc] init];
           [classifiedsShortcut setLocalizedTitle:LOCALIZED(@"classifieds")];
           [classifiedsShortcut setType:@"classifieds"];
           [mutableItems addObject:classifiedsShortcut];

           }

           if (ST4 == 7) {

           SBSApplicationShortcutItem *docsShortcut = [[SBSApplicationShortcutItem alloc] init];
           [docsShortcut setLocalizedTitle:LOCALIZED(@"docs")];
           [docsShortcut setType:@"docs"];
           [mutableItems addObject:docsShortcut];

           }

           if (ST4 == 9) {

           SBSApplicationShortcutItem *likedShortcut = [[SBSApplicationShortcutItem alloc] init];
           [likedShortcut setLocalizedTitle:LOCALIZED(@"liked")];
           [likedShortcut setType:@"liked"];
           [mutableItems addObject:likedShortcut];

           }

           if (ST4 == 11) {

           SBSApplicationShortcutItem *podcastsShortcut = [[SBSApplicationShortcutItem alloc] init];
           [podcastsShortcut setLocalizedTitle:LOCALIZED(@"podcasts")];
           [podcastsShortcut setType:@"podcasts"];
           [mutableItems addObject:podcastsShortcut];

           }
           return mutableItems;
           }else {
           return %orig;
           }
}

%end

%hook AppDelegate

- (void)application:(id)arg1 performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(id)arg3 {
           %orig;
           if([shortcutItem.type isEqualToString:@"groups"]) {
                      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"vk://m.vk.com/groups"] options:@{} completionHandler:nil];
           }

           if([shortcutItem.type isEqualToString:@"favorite"]) {
                      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"vk://m.vk.com/fave"] options:@{} completionHandler:nil];
           }

           if([shortcutItem.type isEqualToString:@"classifieds"]) {
                      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"vk://m.vk.com/classifieds"] options:@{} completionHandler:nil];
           }

           if([shortcutItem.type isEqualToString:@"music"]) {
                      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"vk://m.vk.com/audio?section=explore"] options:@{} completionHandler:nil];
           }

           if([shortcutItem.type isEqualToString:@"docs"]) {
                      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"vk://m.vk.com/docs"] options:@{} completionHandler:nil];
           }

           if([shortcutItem.type isEqualToString:@"liked"]) {
                      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"vk://m.vk.com/feed?section=likes"] options:@{} completionHandler:nil];
           }

           if([shortcutItem.type isEqualToString:@"podcasts"]) {
                      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"vk://m.vk.com/podcasts"] options:@{} completionHandler:nil];
           }
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
           return YES;
}

%end
