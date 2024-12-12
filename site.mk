##	gluon site.mk makefile for Freifunk Westerwald

##	GLUON_FEATURES
#		Specify Gluon features/packages to enable;
#		Gluon will automatically enable a set of packages
#		depending on the combination of features listed

GLUON_FEATURES := \
    autoupdater-fallback \
    config-mode-domain-select \
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
    setup-mode \
    status-page \
    web-advanced \
    web-wizard \
    web-private-wifi

GLUON_FEATURES_standard := \
	mesh-wireless-sae \
	wireless-encryption-wpa3
	

##	GLUON_SITE_PACKAGES
#		specify gluon/openwrt packages to include here
GLUON_SITE_PACKAGES :=\
    iwinfo \
    ffffm-button-bind \
    gluon-autoupdater-branch-fix \
	respondd-module-airtime
    #gluon-ssid-changer
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

#############################
# Additional package sets
#############################
ININCLUDE_USB := \
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
  	usb-modeswitch \
  	ffda-usb-wan-hotplug \
  	ffka-gluon-web-usb-wan-hotplug \
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
  	-usb-modeswitch \
  	-ffda-usb-wan-hotplug \
  	-ffka-gluon-web-usb-wan-hotplug \
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
  EXCLUDE_GPIO := \
    -kmod-gpio-nct5104d \
    -kmod-nls-utf8-kmod-gpio-nct5104d \
    -kmod-gpio-button-hotplug

  ifeq ($(GLUON_TARGET),ath79-generic)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  	GLUON_avm-fritz-wlan-repeater-300e_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_avm-fritz-wlan-repeater-450e_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_d-link-dap-1330-a1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_d-link-dap-1365-a1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_d-link-dir-505_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_d-link-dir825b1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_devolo-wifi-pro-1200e_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_devolo-wifi-pro-1200i_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_devolo-wifi-pro-1750c_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_devolo-wifi-pro-1750i_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_devolo-wifi-pro-1750x_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_netgear-wndr3700_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_netgear-wnr2200-8m_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ocedo-koala_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ocedo-raccoon_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_openmesh-mr1750-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_openmesh-mr600-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_openmesh-mr900-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_openmesh-om2p-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_openmesh-om5p_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_openmesh-om5p-ac-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-archer-c25-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-archer-c58-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-archer-c6-v2-eu-ru-jp_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-archer-c60-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-cpe210-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-cpe210-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-cpe210-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-cpe220-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-cpe510-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-cpe510-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-cpe510-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-re355-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-re450-v1_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-tl-wdr3500-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-tl-wdr3600-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-tl-wdr4300-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-tl-wr810n-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-tl-wr1043nd-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-tl-wr1043nd-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-wbs210-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-wbs210-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-wbs510-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ubiquiti-nanobeam-m5-xw_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ubiquiti-nanostation-loco-m-xw_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ubiquiti-nanostation-m-xw_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ubiquiti-unifi-ac-lite_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ubiquiti-unifi-ac-lr_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ubiquiti-unifi-ac-mesh_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ubiquiti-unifi-ac-mesh-pro_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ubiquiti-unifi-ac-pro_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ubiquiti-unifi-ap_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ubiquiti-unifi-ap-outdoor+_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ubiquiti-unifi-ap-pro_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  endif

  ifeq ($(GLUON_TARGET),ath79-mikrotik)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif

  ifeq ($(GLUON_TARGET),ath79-nand)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif

  ifeq ($(GLUON_TARGET),bcm27xx-bcm2708)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_TOOLS) $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif

  ifeq ($(GLUON_TARGET),bcm27xx-bcm2709)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_TOOLS) $(INCLUDE_USB) $(INCLUDE_USB_HID) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif

  # no pkglists for target bcm27xx-bcm2710


  ifeq ($(GLUON_TARGET),ipq40xx-generic)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif

  ifeq ($(GLUON_TARGET),ipq40xx-mikrotik)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif

  ifeq ($(GLUON_TARGET),ipq806x-generic)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif

  ifeq ($(GLUON_TARGET),lantiq-xrx200)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  	GLUON_tp-link-td-w8970_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  endif

  ifeq ($(GLUON_TARGET),lantiq-xway)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif

  ifeq ($(GLUON_TARGET),mediatek-mt7622)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif

  ifeq ($(GLUON_TARGET),mpc85xx-p1010)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif

  ifeq ($(GLUON_TARGET),mpc85xx-p1020)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif

  # no pkglists for target mvebu-cortexa9


  ifeq ($(GLUON_TARGET),ramips-mt7620)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  	GLUON_netgear-ex3700_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_nexx-wt3020-8m_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-archer-c20i_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-archer-c20-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-archer-c2-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-archer-c50-v1_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)

  endif

  ifeq ($(GLUON_TARGET),ramips-mt7621)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  	GLUON_netgear-ex6150_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ubiquiti-edgerouter-x_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_ubiquiti-edgerouter-x-sfp_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  endif

  ifeq ($(GLUON_TARGET),ramips-mt76x8)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  	GLUON_cudy-wr1000_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_gl.inet-vixmini_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-archer-c50-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-archer-c50-v4_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-tl-wa801nd-v5_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-tl-wr841n-v13_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-archer-c20-v4_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-archer-c20-v5_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-tl-mr3020-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-tl-mr3420-v5_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-tl-wr902ac-v3_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-re305_SITE_PACKAGES += $(EXCLUDE_TLS) $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_netgear-r6020_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  	GLUON_tp-link-re200-v2_SITE_PACKAGES += $(EXCLUDE_USB) $(EXCLUDE_USB_NET) $(EXCLUDE_USB_SERIAL) $(EXCLUDE_USB_STORAGE)
  endif

  ifeq ($(GLUON_TARGET),rockchip-armv8)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

endif

  ifeq ($(GLUON_TARGET),sunxi-cortexa7)
  	GLUON_SITE_PACKAGES += $(INCLUDE_TLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif

  ifeq ($(GLUON_TARGET),x86-64)
  	GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_TLS) $(INCLUDE_TOOLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)$(EXCLUDE_GPIO)

  endif

  ifeq ($(GLUON_TARGET),x86-generic)
  	GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_TLS) $(INCLUDE_TOOLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif

  ifeq ($(GLUON_TARGET),x86-geode)
  	GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_TLS) $(INCLUDE_TOOLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif

  ifeq ($(GLUON_TARGET),x86-legacy)
  	GLUON_SITE_PACKAGES += $(INCLUDE_PCI) $(INCLUDE_PCI_NET) $(INCLUDE_TLS) $(INCLUDE_TOOLS) $(INCLUDE_USB) $(INCLUDE_USB_NET) $(INCLUDE_USB_SERIAL) $(INCLUDE_USB_STORAGE)

  endif