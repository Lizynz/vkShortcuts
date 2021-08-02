export ARCHS = arm64 arm64e
DEBUG = 0
export TARGET = iphone:clang:14.2
GO_EASY_ON_ME = 1

PACKAGE_VERSION = 9.4

export SYSROOT = $(THEOS)/sdks/iPhoneOS14.2.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = vkShortcuts
vkShortcuts_FILES = Tweak.xm DarkFix.xm
vkShortcuts_CFLAGS = -fobjc-arc -Wno-unguarded-availability-new
vkShortcuts_FRAMEWORKS = UIKit CoreGraphics Foundation
vkShortcuts_PRIVATE_FRAMEWORKS = SpringBoardServices BackBoardServices

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += vkshortcuts
include $(THEOS_MAKE_PATH)/aggregate.mk
