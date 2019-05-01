ARCHS = armv7 arm64 arm64e
TARGET = iphone:clang::10.0
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Diclose
Diclose_FILES = Tweak.xm
Diclose_FRAMEWORKS = UIKit
Diclose_LDFLAGS = -Wl,-segalign,4000
Diclose_LOGOS_DEFAULT_GENERATOR = internal

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 MobileNotes DDActionsService"
