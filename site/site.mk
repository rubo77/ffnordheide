GLUON_SITE_PACKAGES := \
	gluon-mesh-batman-adv-15 \
	gluon-alfred \
	gluon-respondd \
	gluon-autoupdater \
	gluon-setup-mode \
	gluon-config-mode-core \
	gluon-config-mode-autoupdater \
	gluon-config-mode-hostname \
	gluon-config-mode-mesh-vpn \
	gluon-ebtables-filter-multicast \
	gluon-ebtables-filter-ra-dhcp \
	gluon-luci-admin \
	gluon-luci-autoupdater \
	gluon-luci-portconfig \
	gluon-luci-private-wifi \
	gluon-luci-wifi-config \
	gluon-next-node \
	gluon-mesh-vpn-fastd \
	gluon-radvd \
	gluon-status-page \
	iwinfo \
	iptables \
	haveged


DEFAULT_GLUON_RELEASE := 2016.2.1
#DEFAULT_GLUON_RELEASE := 0.16.6 
# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

GLUON_PRIORITY ?= 0
GLUON_BRANCH ?= experimental
export GLUON_BRANCH

GLUON_TARGET ?= ar71xx-generic
export GLUON_TARGET

GLUON_LANGS ?= de en

# support the USB stack
USB_PACKAGES_BASIC := \
	kmod-usb-core \
	kmod-usb2
# FAT32 Support for USB
USB_PACKAGES := $(USB_PACKAGES_BASIC) \
    block-mount \
    kmod-fs-ext4 \
    kmod-fs-vfat \
    kmod-usb-storage  \
    kmod-usb-storage-extras  \
    blkid  \
    swap-utils  \
    kmod-nls-cp1250  \
    kmod-nls-cp1251  \
    kmod-nls-cp437  \
    kmod-nls-cp775  \
    kmod-nls-cp850  \
    kmod-nls-cp852  \
    kmod-nls-cp866  \
    kmod-nls-iso8859-1  \
    kmod-nls-iso8859-13  \
    kmod-nls-iso8859-15  \
    kmod-nls-iso8859-2  \
    kmod-nls-koi8r  \
    kmod-nls-utf8

ifeq ($(GLUON_TARGET),x86-generic)
	# support the USB stack on x86 devices
	# and add a few common USB NICs
	GLUON_SITE_PACKAGES += $(USB_PACKAGES) \
		kmod-usb-hid \
		kmod-usb-net \
		kmod-usb-net-asix \
		kmod-usb-net-dm9601-ether
endif

ifeq ($(GLUON_TARGET),ar71xx-generic)
	GLUON_TLWR710_SITE_PACKAGES := $(USB_PACKAGES_BASIC)
	GLUON_TLWR1043_SITE_PACKAGES := $(USB_PACKAGES)
	GLUON_TLWR842_SITE_PACKAGES := $(USB_PACKAGES)
	GLUON_TLWDR4300_SITE_PACKAGES := $(USB_PACKAGES)
	GLUON_TLWR2543_SITE_PACKAGES := $(USB_PACKAGES)
	GLUON_WRT160NL_SITE_PACKAGES := $(USB_PACKAGES)
	GLUON_DIR825B1_SITE_PACKAGES := $(USB_PACKAGES)
	GLUON_GLINET_SITE_PACKAGES := $(USB_PACKAGES)
	GLUON_WNDR3700_SITE_PACKAGES := $(USB_PACKAGES)
	GLUON_WZRHPG450H_SITE_PACKAGES := $(USB_PACKAGES)
	GLUON_WZRHPAG300H_SITE_PACKAGES := $(USB_PACKAGES)
	GLUON_ARCHERC7_SITE_PACKAGES := $(USB_PACKAGES)
endif

ifeq ($(GLUON_TARGET),mpc85xx-generic)
	GLUON_TLWDR4900_SITE_PACKAGES := $(USB_PACKAGES)
endif
