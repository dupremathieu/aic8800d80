
KVERSION := $(shell uname -r)
DKMS_DEST_MODULE_DIR := /usr/src/aic8800-dkms-1.0.0/

dkms:
	cp -a . $(DKMS_DEST_MODULE_DIR)
	dkms add -m aic8800-dkms -v 1.0.0
	dkms build -m aic8800-dkms -v 1.0.0
	dkms install -m aic8800-dkms -v 1.0.0

dkms-remove:
	dkms remove -m aic8800-dkms -v 1.0.0 --all
