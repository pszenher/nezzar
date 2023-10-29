(use-modules ((gnu packages linux) #:prefix gnu:)
	     (guix gexp)
	     ((nongnu packages linux) #:prefix nongnu:))

(gnu:customize-linux
 #:name "linux-custom"
 #:linux nongnu:linux
 #:defconfig "x86_64_defconfig"
 ;; #:defconfig (plain-file "defcustom_kcma_d8"
 ;; 			 "CONFIG_X86_MSR=m
 ;; CONFIG_MODULES=y
 ;; CONFIG_VIRTIO_BLK=m
 ;; CONFIG_INPUT_JOYDEV=m
 ;; CONFIG_SERIO_RAW=m
 ;; CONFIG_VIRTIO_CONSOLE=m
 ;; CONFIG_IPMI_HANDLER=m
 ;; CONFIG_IPMI_DEVICE_INTERFACE=m
 ;; CONFIG_IPMI_SI=m
 ;; CONFIG_HW_RANDOM_VIRTIO=m
 ;; CONFIG_PPS=m
 ;; CONFIG_SENSORS_W83795=m
 ;; CONFIG_MEDIA_SUPPORT=m
 ;; CONFIG_DRM=m
 ;; CONFIG_SOUND=m
 ;; CONFIG_SND=m
 ;; CONFIG_HID=m
 ;; CONFIG_VIRTIO_BALLOON=m
 ;; CONFIG_ACPI_WMI=m
 ;; CONFIG_FUSE_FS=m
 ;; CONFIG_FSCACHE=m
 ;; CONFIG_NLS_ISO8859_1=m
 ;; CONFIG_CRYPTO_SERPENT=m
 ;; CONFIG_CRYPTO_XTS=m
 ;; CONFIG_CRYPTO_WP512=m
 ;; CONFIG_CRYPTO_AES_NI_INTEL=m
 ;; CONFIG_CRYPTO_POLYVAL_CLMUL_NI=m
 ;; CONFIG_CRYPTO_SHA512_SSSE3=m
 ;; CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m
 ;; CONFIG_CRYPTO_CRC32_PCLMUL=m
 ;; CONFIG_LIBCRC32C=m
 ;; CONFIG_NET_9P=m
 ;; CONFIG_NET_9P_VIRTIO=m
 ;; CONFIG_VIRTIO_NET=m
 ;; CONFIG_VIRTIO_PCI=m
 ;; CONFIG_VIRTIO_MMIO=m
 ;; CONFIG_CIFS=m
 ;; CONFIG_9P_FS=m
 ;; ")
 #:configs ""
 ;; '(;; Make the kernel config available at /proc/config.gz
 ;;   "CONFIG_IKCONFIG=y"
 ;;   "CONFIG_IKCONFIG_PROC=y"

 ;;   ;; Enable namespaces
 ;;   ;; TODO: can guix run without these?
 ;;   "CONFIG_NAMESPACES=y"
 ;;   "CONFIG_UTS_NS=y"
 ;;   "CONFIG_IPC_NS=y"
 ;;   "CONFIG_USER_NS=y"
 ;;   "CONFIG_PID_NS=y"
 ;;   "CONFIG_NET_NS=y"

 ;;   ;; Needed for initrd
 ;;   "CONFIG_NET_9P=y"
 ;;   "CONFIG_NET_9P_VIRTIO=y"
 ;;   "CONFIG_VIRTIO_BLK=y"
 ;;   "CONFIG_VIRTIO_NET=y"
 ;;   "CONFIG_VIRTIO_PCI=y"
 ;;   "CONFIG_VIRTIO_BALLOON=y"
 ;;   "CONFIG_VIRTIO_MMIO=y"
 ;;   "CONFIG_FUSE_FS=y"
 ;;   "CONFIG_CIFS=y"
 ;;   "CONFIG_9P_FS=y")
 #:extra-version "bucephalus")

;;  CONFIG_NET_9P=y
;; CONFIG_NET_9P_VIRTIO=y
;; CONFIG_VIRTIO_NET=y
;; CONFIG_VIRTIO_PCI=y
;; CONFIG_VIRTIO_MMIO=y
;; CONFIG_FUSE_FS=y
;; CONFIG_CIFS=y
;; CONFIG_9P_FS=y
