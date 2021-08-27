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
    iptables \
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

# USB Human Interface
INCLUDE_USB_HID := \
	kmod-usb-hid \
	kmod-hid-generic
EXCLUDE_USB_HID := \
	-kmod-usb-hid \
	-kmod-hid-generic
# USB Serial
INCLUDE_USB_SERIAL := \
	kmod-usb-serial \
	kmod-usb-serial-ftdi \
	kmod-usb-serial-pl2303
EXCLUDE_USB_SERIAL := \
	-kmod-usb-serial \
	-kmod-usb-serial-ftdi \
	-kmod-usb-serial-pl2303
# USB Storage
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
	kmod-nls-cp1251 \
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
	-kmod-nls-cp1251 \
	-kmod-nls-cp437 \
	-kmod-nls-cp850 \
	-kmod-nls-cp852 \
	-kmod-nls-iso8859-1 \
	-kmod-nls-iso8859-13 \
	-kmod-nls-iso8859-15 \
	-kmod-nls-iso8859-2 \
	-kmod-nls-utf8

# USB Network
INCLUDE_USB_NET := \
	usb-modeswitch \
	ffda-usb-wan-hotplug \
	ffka-gluon-web-usb-wan-hotplug \
	kmod-ath9k-htc \
	kmod-rt2800-usb \
	kmod-mii \
	kmod-nls-base \
	kmod-usb-net \
	kmod-usb-net-asix \
	kmod-usb-net-asix-ax88179 \
	kmod-usb-net-cdc-eem \
	kmod-usb-net-cdc-ether \
	kmod-usb-net-cdc-mbim \
	kmod-usb-net-cdc-subset \
	kmod-usb-net-dm9601-ether \
	kmod-usb-net-hso \
	kmod-usb-net-huawei-cdc-ncm \
	kmod-usb-net-ipheth \
	kmod-usb-net-kalmia \
	kmod-usb-net-kaweth \
	kmod-usb-net-mcs7830 \
	kmod-usb-net-pegasus \
	kmod-usb-net-qmi-wwan \
	kmod-usb-net-rndis \
	kmod-usb-net-rtl8152 \
	kmod-usb-net-sierrawireless \
	kmod-usb-net-smsc95xx
EXCLUDE_USB_NET := \
	-usb-modeswitch \
	-ffda-usb-wan-hotplug \
	-ffka-gluon-web-usb-wan-hotplug \
	-kmod-ath9k-htc \
	-kmod-rt2800-usb \
	-kmod-mii \
	-kmod-nls-base \
	-kmod-usb-net \
	-kmod-usb-net-asix \
	-kmod-usb-net-asix-ax88179 \
	-kmod-usb-net-cdc-eem \
	-kmod-usb-net-cdc-ether \
	-kmod-usb-net-cdc-mbim \
	-kmod-usb-net-cdc-subset \
	-kmod-usb-net-dm9601-ether \
	-kmod-usb-net-hso \
	-kmod-usb-net-huawei-cdc-ncm \
	-kmod-usb-net-ipheth \
	-kmod-usb-net-kalmia \
	-kmod-usb-net-kaweth \
	-kmod-usb-net-mcs7830 \
	-kmod-usb-net-pegasus \
	-kmod-usb-net-qmi-wwan \
	-kmod-usb-net-rndis \
	-kmod-usb-net-rtl8152 \
	-kmod-usb-net-sierrawireless \
	-kmod-usb-net-smsc95xx

INCLUDE_PCI := \
	pciutils
EXCLUDE_PCI := \
	-pciutils

INCLUDE_PCI_NET := \
	kmod-bnx2
EXCLUDE_PCI_NET := \
	-kmod-bnx2

INCLUDE_TLS := \
	ca-bundle \
	libustream-openssl
EXCLUDE_TLS := \
	-ca-bundle \
	-libustream-openssl

INCLUDE_TOOLS := \
	iperf3 \
	socat \
	tcpdump \
	vnstat
EXCLUDE_TOOLS := \
	-iperf3 \
	-socat \
	-tcpdump \
	-vnstat

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

ifeq ($(GLUON_TARGET),ar71xx-generic)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

	GLUON_allnet-all0315n_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_avm-fritz-wlan-repeater-300e_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_avm-fritz-wlan-repeater-450e_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_d-link-dap-1330-rev-a1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_d-link-dir-825-rev-b1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_meraki-mr12_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_meraki-mr16_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ocedo-koala_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_openmesh-mr1750_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_openmesh-mr600_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_openmesh-mr900_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_openmesh-om2p_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_openmesh-om5p_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_openmesh-om5p-ac_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-cpe210-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-cpe210-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-cpe210-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-cpe510-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-wbs210-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-wbs510-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-archer-c25-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-archer-c58-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-archer-c60-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-archer-c60-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-re355_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-re450_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-airgateway_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-airgateway-pro_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-bullet-m_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-rocket-m_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-nanostation-m_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-loco-m-xw_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-nanostation-m-xw_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-rocket-m-xw_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-rocket-m-ti_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-unifi_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-unifi-ap-pro_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-unifiap-outdoor_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-unifiap-outdoor+_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-ls-sr71_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-unifi-ac-lite_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-unifi-ac-lr_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-unifi-ac-pro_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-unifi-ac-mesh_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_linksys-wrt160nl_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-tl-wr710n-v1_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-tl-wr710n-v2.1_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-tl-wr842n-nd-v1_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-tl-wr842n-nd-v2_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-tl-wr1043n-nd-v1_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubiquiti-airrouter_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
endif

# no pkglists for target ar71xx-mikrotik


ifeq ($(GLUON_TARGET),ar71xx-nand)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

# no pkglists for target ar71xx-tiny


ifeq ($(GLUON_TARGET),ath79-generic)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

	GLUON_devolo-wifi-pro-1200e_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_devolo-wifi-pro-1200i_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_devolo-wifi-pro-1750c_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_devolo-wifi-pro-1750i_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_devolo-wifi-pro-1750x_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ocedo-raccoon_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-archer-c6-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-cpe220-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
endif

ifeq ($(GLUON_TARGET),brcm2708-bcm2708)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_TOOLS) $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),brcm2708-bcm2709)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_TOOLS) $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),brcm2708-bcm2710)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_TOOLS) $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),ipq40xx-generic)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),ipq806x-generic)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),lantiq-xrx200)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),lantiq-xway)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),mpc85xx-generic)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),mpc85xx-p1020)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),mvebu-cortexa9)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),ramips-mt7620)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),ramips-mt7621)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

	GLUON_netgear-ex6150_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubnt-erx_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_ubnt-erx-sfp_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
endif

ifeq ($(GLUON_TARGET),ramips-mt76x8)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

	GLUON_cudy-wr1000_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_gl.inet-vixmini_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-archer-c50-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-archer-c50-v4_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-tl-wa801nd-v5_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
	GLUON_tp-link-tl-wr841n-v13_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
endif

# no pkglists for target ramips-rt305x


ifeq ($(GLUON_TARGET),sunxi-cortexa7)
	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),x86-64)
	GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_TLS) $(INCLUDE_TOOLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),x86-generic)
	GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_TLS) $(INCLUDE_TOOLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

ifeq ($(GLUON_TARGET),x86-geode)
	GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_TLS) $(INCLUDE_TOOLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif
