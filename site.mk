##	gluon site.mk makefile for Freifunk Westerwald

##	GLUON_FEATURES
#		Specify Gluon features/packages to enable;
#		Gluon will automatically enable a set of packages
#		depending on the combination of features listed

GLUON_FEATURES := \
    autoupdater-fallback \
    config-mode-geo-location-osm \
    config-mode-mesh-vpn \
    ebtables-filter-multicast \
    ebtables-filter-ra-dhcp \
    ebtables-source-filter \
    ebtables-limit-arp \
    radv-filterd \
    mesh-batman-adv-15 \
    mesh-vpn-wireguard-vxlan \
    respondd \
    status-page \
    web-advanced \
    web-wizard \
    web-private-wifi

GLUON_FEATURES_standard := \
	mesh-wireless-sae \
	mesh-wireless-sae \
	wireless-encryption-wpa3 
	

##	GLUON_SITE_PACKAGES
#		specify gluon/openwrt packages to include here
GLUON_SITE_PACKAGES :=\
    iwinfo \
    ca-bundle \
    libustream-openssl\
    ffffm-button-bind \
    gluon-banner \
    gluon-autoupdater-branch-fix \
    gluon-ssid-changer
#    respondd-module-airtime \
#	 gluon-config-mode-geo-location-osm
#############################
# Additional package sets
#############################
INCLUDE_USB := \
    usbutils

EXCLUDE_USB := \
    -usbutils

INCLUDE_USB_HID := \
    kmod-usb-hid \
    kmod-hid-generic

EXCLUDE_USB_HID := \
    -kmod-usb-hid \
    -kmod-hid-generic

INCLUDE_USB_SERIAL := \
    kmod-usb-serial \
    kmod-usb-serial-ftdi \
    kmod-usb-serial-pl2303

EXCLUDE_USB_SERIAL := \
    -kmod-usb-serial \
    -kmod-usb-serial-ftdi \
    -kmod-usb-serial-pl2303

INCLUDE_USB_STORAGE := \
    block-mount \
    blkid \
    kmod-fs-ext4 \
    kmod-fs-ntfs \
    kmod-fs-vfat \
    kmod-usb-storage \
    kmod-usb-storage-extras \
    kmod-usb-storage-uas \
    kmod-nls-base \
    kmod-nls-cp1250 \
    kmod-nls-cp437 \
    kmod-nls-cp850 \
    kmod-nls-cp852 \
    kmod-nls-iso8859-1 \
    kmod-nls-iso8859-13 \
    kmod-nls-iso8859-15 \
    kmod-nls-iso8859-2 \
    kmod-nls-utf8

EXCLUDE_USB_STORAGE := \
    -block-mount \
    -blkid \
    -kmod-fs-ext4 \
    -kmod-fs-ntfs \
    -kmod-fs-vfat \
    -kmod-usb-storage \
    -kmod-usb-storage-extras \
    -kmod-usb-storage-uas \
    -kmod-nls-base \
    -kmod-nls-cp1250 \
    -kmod-nls-cp437 \
    -kmod-nls-cp850 \
    -kmod-nls-cp852 \
    -kmod-nls-iso8859-1 \
    -kmod-nls-iso8859-13 \
    -kmod-nls-iso8859-15 \
    -kmod-nls-iso8859-2 \
    -kmod-nls-utf8

INCLUDE_USB_NET := \
    kmod-mii \
    kmod-usb-net \
    kmod-usb-net-asix \
    kmod-usb-net-asix-ax88179 \
    kmod-usb-net-cdc-eem \
    kmod-usb-net-cdc-ether \
    kmod-usb-net-cdc-subset \
    kmod-usb-net-dm9601-ether \
    kmod-usb-net-hso \
    kmod-usb-net-ipheth \
    kmod-usb-net-mcs7830 \
    kmod-usb-net-pegasus \
    kmod-usb-net-rndis \
    kmod-usb-net-rtl8152 \
    kmod-usb-net-smsc95xx

EXCLUDE_USB_NET := \
    -kmod-mii \
    -kmod-usb-net \
    -kmod-usb-net-asix \
    -kmod-usb-net-asix-ax88179 \
    -kmod-usb-net-cdc-eem \
    -kmod-usb-net-cdc-ether \
    -kmod-usb-net-cdc-subset \
    -kmod-usb-net-dm9601-ether \
    -kmod-usb-net-hso \
    -kmod-usb-net-ipheth \
    -kmod-usb-net-mcs7830 \
    -kmod-usb-net-pegasus \
    -kmod-usb-net-rndis \
    -kmod-usb-net-rtl8152 \
    -kmod-usb-net-smsc95xx

INCLUDE_PCI := \
    pciutils

EXCLUDE_PCI := \
    -pciutils

INCLUDE_PCI_NET := \
    kmod-bnx2

EXCLUDE_PCI_NET := \
    -kmod-bnx2

EXCLUDE_TLS := \
	-ca-bundle \
	-libustream-openssl

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

ifeq ($(GLUON_TARGET),ath79-generic)

    GLUON_devolo-wifi-pro-1750e_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-re450-v1_SITE_PACKAGES += $(EXCLUDE_TLS)
    GLUON_gl.inet-gl-ar150_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_gl.inet-gl-ar300m-lite_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_gl.inet-gl-ar750_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_joy-it-jt-or750i_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_netgear-wndr3700-v2_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-archer-a7-v5_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-archer-c5-v1_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-archer-c7-v2_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-archer-c7-v5_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-archer-c59-v1_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-tl-wr842n-v3_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-tl-wr1043nd-v4_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-tl-wr1043n-v5_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
endif

# no pkglists for target ath79-mikrotik


# no pkglists for target ath79-nand


ifeq ($(GLUON_TARGET),bcm27xx-bcm2708)
    GLUON_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),bcm27xx-bcm2709)
    GLUON_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),bcm27xx-bcm2710)
    GLUON_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),ipq40xx-generic)
    GLUON_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

# no pkglists for target ipq40xx-mikrotik


ifeq ($(GLUON_TARGET),ipq806x-generic)
    GLUON_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),lantiq-xrx200)
    GLUON_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

    GLUON_avm-fritz-box-7412_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-td-w8970_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_tp-link-td-w8980_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
endif

# no pkglists for target lantiq-xway


ifeq ($(GLUON_TARGET),mediatek-mt7622)
    GLUON_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

    GLUON_ubiquiti-unifi-6-lr-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
endif

ifeq ($(GLUON_TARGET),mpc85xx-p1010)
    GLUON_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),mpc85xx-p1020)
    GLUON_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),mvebu-cortexa9)
    GLUON_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

# no pkglists for target ramips-mt7620


ifeq ($(GLUON_TARGET),ramips-mt7621)
    GLUON_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

    GLUON_netgear-ex6150_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_ubiquiti-edgerouter-x_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
    GLUON_ubiquiti-edgerouter-x-sfp_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
endif

ifeq ($(GLUON_TARGET),ramips-mt76x8)

    GLUON_gl-mt300n-v2_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_gl.inet-microuter-n300_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_netgear-r6120_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_ravpower-rp-wd009_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)
    GLUON_tp-link-re305_SITE_PACKAGES += $(EXCLUDE_TLS)
endif

ifeq ($(GLUON_TARGET),rockchip-armv8)
    GLUON_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),sunxi-cortexa7)
    GLUON_SITE_PACKAGES += $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),x86-64)
    GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),x86-generic)
    GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),x86-geode)
    GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif


