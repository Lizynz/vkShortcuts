include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = vkShortcuts
vkShortcuts_FILES = vkShortcutsRootListController.m
vkShortcuts_INSTALL_PATH = /var/jb/Library/PreferenceBundles
vkShortcuts_FRAMEWORKS = UIKit
vkShortcuts_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/var/jb/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/var/jb/Library/PreferenceLoader/Preferences/vkShortcuts.plist$(ECHO_END)
