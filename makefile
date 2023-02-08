FVM := $(shell which fvm)

ifdef FVM
FLUTTER := fvm flutter
else
FLUTTER := flutter
endif

lint:
	EXIT_CODE=0 ; \
    $(FLUTTER)  analyze || EXIT_CODE=1 ; \
	exit $$EXIT_CODE