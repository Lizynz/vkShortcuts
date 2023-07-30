#DEBUG = 0

ROOTLESS ?= 0

ifeq ($(ROOTLESS),1)
	TARGET = iphone:clang:14.2
	THEOS_LAYOUT_DIR_NAME = layout-rootless
	THEOS_PACKAGE_SCHEME = rootless
else
	TARGET = iphone:clang:14.2
endif

GO_EASY_ON_ME = 1
PACKAGE_VERSION = 11.1

export SYSROOT = $(THEOS)/sdks/iPhoneOS14.2.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = vkShortcuts
vkShortcuts_FILES = Tweak.xm
vkShortcuts_FRAMEWORKS = UIKit CoreGraphics Foundation
vkShortcuts_PRIVATE_FRAMEWORKS = SpringBoardServices

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += vkshortcuts
include $(THEOS_MAKE_PATH)/aggregate.mk
