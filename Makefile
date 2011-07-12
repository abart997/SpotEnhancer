include theos/makefiles/common.mk
export GO_EASY_ON_ME=1
TWEAK_NAME = SpotEnhancer
SpotEnhancer_FILES = Tweak.xm 
SpotEnhancer_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk
