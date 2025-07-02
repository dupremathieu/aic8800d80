
KVERSION := $(shell uname -r)

dkms:
	cp -a . /usr/src/aic8800-1.0.0
	dkms add -m aic8800 -v 1.0.0
	dkms build -m aic8800 -v 1.0.0
	dkms install -m aic8800 -v 1.0.0

dkms-remove:
	dkms remove -m aic8800 -v 1.0.0 --all

