@interface _UIContextMenuActionView : UIView
- (void)setTrailingImage:(UIImage*)arg1;
@end

@interface _UIContextMenuActionsListCell : UICollectionViewCell
@property (nonatomic,readonly) _UIContextMenuActionView *actionView;
@end

static const NSBundle *tweakBundle = [NSBundle bundleWithPath:@"/Library/Application Support/vkShortcuts/Localizations.bundle"];
#define LOCALIZED(str) [tweakBundle localizedStringForKey:str value:@"" table:nil]

%hook _UIContextMenuActionView //iOS 13.x Fix

- (instancetype)initWithTitle:(NSString*)title subtitle:(NSString*)subtitle image:(UIImage*)image {

if([title isEqualToString:LOCALIZED(@"groups")])
    {
        image = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/vkShortcuts/community-dark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    else if([title isEqualToString:LOCALIZED(@"favorite")])
    {
        image = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/vkShortcuts/favorite-dark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    else if([title isEqualToString:LOCALIZED(@"music")])
    {
        image = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/vkShortcuts/music-dark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
        else if([title isEqualToString:LOCALIZED(@"classifieds")])
    {
        image = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/vkShortcuts/classifieds-dark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
        else if([title isEqualToString:LOCALIZED(@"docs")])
    {
        image = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/vkShortcuts/document-dark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
        else if([title isEqualToString:LOCALIZED(@"liked")])
    {
        image = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/vkShortcuts/like-dark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
        else if([title isEqualToString:LOCALIZED(@"podcasts")])
    {
        image = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/vkShortcuts/podcast-dark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    
    return %orig;
}

%end

%hook _UIContextMenuActionsListView //iOS 14.x Fix

- (void)_configureCell:(_UIContextMenuActionsListCell*)cell forElement:(UIMenuElement*)element section:(id)arg3 {
        %orig;

    if(element && element.title)
    {
        UIImage* imageToSet;

        if([element.title isEqualToString:LOCALIZED(@"groups")])
        {
            imageToSet = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/vkShortcuts/community-dark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }
        else if([element.title isEqualToString:LOCALIZED(@"favorite")])
        {
            imageToSet = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/vkShortcuts/favorite-dark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }
        else if([element.title isEqualToString:LOCALIZED(@"music")])
        {
            imageToSet = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/vkShortcuts/music-dark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }
        else if([element.title isEqualToString:LOCALIZED(@"classifieds")])
        {
            imageToSet = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/vkShortcuts/classifieds-dark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }
        else if([element.title isEqualToString:LOCALIZED(@"docs")])
        {
            imageToSet = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/vkShortcuts/document-dark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }
        else if([element.title isEqualToString:LOCALIZED(@"liked")])
        {
            imageToSet = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/vkShortcuts/like-dark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }
        else if([element.title isEqualToString:LOCALIZED(@"podcasts")])
        {
            imageToSet = [[UIImage imageWithContentsOfFile:@"/Library/Application Support/vkShortcuts/podcast-dark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }

        if(imageToSet)
        {
            [cell.actionView setTrailingImage:imageToSet];
        }
    }
}

%end
