FVM := $(shell which fvm)

ifdef FVM
FLUTTER := fvm flutter
else
FLUTTER := flutter
endif

clean:
	$(FLUTTER) clean || exit 1 ;


lint:
	EXIT_CODE=0 ; \
    $(FLUTTER) analyze || EXIT_CODE=1 ; \
	exit $$EXIT_CODE

app-test:
	EXIT_CODE=0 ; \
	$(FLUTTER) test --no-test-assets || EXIT_CODE=1 ; \
	exit $$EXIT_CODE