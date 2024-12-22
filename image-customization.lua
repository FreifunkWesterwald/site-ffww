features({
    'autoupdater-fallback',
    'config-mode-domain-select',
    'config-mode-geo-location-osm',
    'config-mode-mesh-vpn',
    'ebtables-filter-multicast',
    'ebtables-filter-ra-dhcp',
    'ebtables-source-filter',
    'ebtables-limit-arp',
    'radv-filterd',
    'mesh-batman-adv-15',
    'mesh-vpn-wireguard-vxlan',
    'respondd',
    'setup-mode',
    'status-page',
    'web-advanced',
    'web-wizard',
    'web-private-wifi',
    'mesh-wireless-sae',
    'wireless-encryption-wpa3',

})
packages({
        'iwinfo',
        'libustream-openssl',
        'ffffm-button-bind',
        'gluon-banner' ,
        'gluon-autoupdater-branch-fix',
})

-- Custom package lists
local pkgs_usb_hid = {
	'kmod-usb-hid',
	'kmod-hid-generic'
}

local pkgs_usb_serial = {
	'kmod-usb-serial',
	'kmod-usb-serial-ch341',
	'kmod-usb-serial-cp210x',
	'kmod-usb-serial-ftdi',
	'kmod-usb-serial-pl2303'
}

local pkgs_usb_storage = {
	'block-mount',
	'blkid',
	'kmod-fs-ext4',
	'kmod-fs-ntfs',
	'kmod-fs-vfat',
	'kmod-usb-storage',
	'kmod-usb-storage-extras',  -- Card Readers
	'kmod-usb-storage-uas',     -- USB Attached SCSI (UAS/UASP)
	'kmod-nls-base',
	'kmod-nls-cp1250',          -- NLS Codepage 1250 (Eastern Europe)
	'kmod-nls-cp437',           -- NLS Codepage 437 (United States, Canada)
	'kmod-nls-cp850',           -- NLS Codepage 850 (Europe)
	'kmod-nls-cp852',           -- NLS Codepage 852 (Europe)
	'kmod-nls-iso8859-1',       -- NLS ISO 8859-1 (Latin 1)
	'kmod-nls-iso8859-13',      -- NLS ISO 8859-13 (Latin 7; Baltic)
	'kmod-nls-iso8859-15',      -- NLS ISO 8859-15 (Latin 9)
	'kmod-nls-iso8859-2',       -- NLS ISO 8859-2 (Latin 2)
	'kmod-nls-utf8'             -- NLS UTF-8
}

local pkgs_usb_net = {
	'kmod-mii',
	'kmod-usb-net',
	'kmod-usb-net-asix',
	'kmod-usb-net-asix-ax88179',
	'kmod-usb-net-cdc-eem',
	'kmod-usb-net-cdc-ether',
	'kmod-usb-net-cdc-subset',
	'kmod-usb-net-dm9601-ether',
	'kmod-usb-net-hso',
	'kmod-usb-net-ipheth',
	'kmod-usb-net-mcs7830',
	'kmod-usb-net-pegasus',
	'kmod-usb-net-rndis',
	'kmod-usb-net-rtl8152',
	'kmod-usb-net-smsc95xx',
}

local pkgs_pci = {
	'pciutils'
}

local pkgs_pci_net = {
	'kmod-bnx2'
}

if target('ath79') then
	packages(pkgs_usb_serial)
end

if target('ipq40xx') then
	packages(pkgs_usb_serial)
	packages(pkgs_usb_storage)
end

if target('ipq806x') then
	packages(pkgs_usb_serial)
	packages(pkgs_usb_storage)
end

if target('mediatek') then
	packages(pkgs_usb_serial)
	packages(pkgs_usb_storage)
end

if target('mpc85xx') then
	packages(pkgs_usb_serial)
	packages(pkgs_usb_storage)
end

if target('ramips', 'mt7621') then
	packages(pkgs_usb_serial)
end

if target('rockchip') then
	-- No PCI / video
	packages(pkgs_usb_net)
	packages(pkgs_usb_serial)
	packages(pkgs_usb_storage)
end

if target('sunxi') then
	-- No PCI / video
	packages(pkgs_usb_serial)
	packages(pkgs_usb_storage)
end

-- Include all custom packages for RaspberryPi
if target('bcm27xx') then
	packages(pkgs_usb_hid)
	packages(pkgs_usb_net)
	packages(pkgs_usb_serial)
	packages(pkgs_usb_storage)
end

-- Include all custom packages for x86
if target('x86') then
	packages(pkgs_pci)
	packages(pkgs_pci_net)
	packages(pkgs_usb_hid)
	packages(pkgs_usb_net)
	packages(pkgs_usb_serial)
	packages(pkgs_usb_storage)
end

