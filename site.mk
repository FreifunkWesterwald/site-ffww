##	gluon site.mk makefile for Freifunk Westerwald

##	GLUON_FEATURES
#		Specify Gluon features/packages to enable;
#		Gluon will automatically enable a set of packages
#		depending on the combination of features listed

GLUON_FEATURES := \
	autoupdater \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	ebtables-limit-arp \
	mesh-batman-adv-15 \
	mesh-vpn-fastd \
	respondd \
	status-page \
	web-advanced \
	web-wizard

##	GLUON_SITE_PACKAGES
#		specify gluon/openwrt packages to include here
GLUON_SITE_PACKAGES := iwinfo #\
#	gluon-respondd \
#	gluon-autoupdater \
#	gluon-config-mode-core \
#	gluon-config-mode-autoupdater\
#	gluon-config-mode-hostname \
#	gluon-config-mode-mesh-vpn \
#	gluon-config-mode-geo-location \
#	gluon-config-mode-contact-info \
#	gluon-ebtables-filter-multicast \
#	gluon-ebtables-filter-ra-dhcp \
#	gluon-web-admin \
#	gluon-web-autoupdater \
#	gluon-web-network \
#	gluon-web-wifi-config \
#	gluon-mesh-batman-adv-15 \
#	gluon-mesh-vpn-fastd \
#	gluon-radvd \
#	gluon-setup-mode \
#	gluon-status-page \
#	iwinfo \
#	iptables \
#	haveged \
#	gluon-web-private-wifi \
#	gluon-banner \
#	gluon-ssid-changer

##	DEFAULT_GLUON_RELEASE
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

## GLUON_REGION
# 		Set Gluon Region
GLUON_REGION  := eu


# Default priority for updates.
GLUON_PRIORITY ?= 0

# Languages to include
GLUON_LANGS ?= en de

GLUON_DEPRECATED ?= 0
