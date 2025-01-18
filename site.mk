##	gluon site.mk makefile for Freifunk Westerwald

##	GLUON_FEATURES
#		Specify Gluon features/packages to enable;
#		Gluon will automatically enable a set of packages
#		depending on the combination of features listed


#GLUON_FEATURES_standard := \
#	mesh-wireless-sae \
#	wireless-encryption-wpa3
	

##	GLUON_SITE_PACKAGES
#		specify gluon/openwrt packages to include here
#GLUON_SITE_PACKAGES :=\
#    iwinfo \
#    ffffm-button-bind \
#    gluon-autoupdater-branch-fix \
#	respondd-module-airtime
#    #gluon-ssid-changer
#	 gluon-config-mode-geo-location-osm
#    gluon-banner \



#	DEFAULT_GLUON_RELEASE
#		version string to use for images
#		gluon relies on
#			opkg compare-versions "$1" '>>' "$2"
#		to decide if a version is newer or not.
DEFAULT_GLUON_RELEASE := XX+master$(shell date '+%Y%m%d%H%M')


##	GLUON_RELEASE
#		call make with custom GLUON_RELEASE flag, to use your own release version scheme.
#		e.g.:
#			$ make images GLUON_RELEASE=23.42+5
#		would generate images named like this:
#			gluon-ff%site_code%-23.42+5-%router_model%.bin

GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

# Enable autoupdater
GLUON_AUTOUPDATER_ENABLED := 1
## GLUON_REGION
# 		Set Gluon Region
GLUON_REGION  := eu


# Default priority for updates.
GLUON_PRIORITY ?= 0

# Languages to include
GLUON_LANGS ?= en de
GLUON_MULTIDOMAIN = 1
GLUON_DEPRECATED ?= 0
