# Makefile rules

MKT:=go-dep-tarball
$(info Checking for $(MKT)...)
ifeq ($(shell command -v $(MKT) 2>/dev/null),)
$(error ==> $(MKT) not found in PATH)
else
$(info $(MKT) found in PATH)
endif

PN := $(shell basename "$$(pwd)")
# However, info.mk (contains VERSION, what kind, etc.)
# should be in the same directory as the symlink
$(info Checking for tarball.mk...)
ifneq ("$(wildcard tarball.mk)","")
include tarball.mk
$(info ==> tarball.mk found)
else
$(error tarball.mk not found)
endif
P := $(PN)-$(PV)
S ?= $(P)

split_uri = $(word 1, $(subst ->, ,$(subst ",,$1))) $(word 2, $(subst ->, ,$(subst ",,$1)))
DOWNLOAD_URL = $(word 1, $(call split_uri, $(SRC_URI)))
DOWNLOADED_TARBALL = $(word 2, $(call split_uri, $(SRC_URI)))
OUTPUT_TARBALL = $(PN)-$(PV)-deps.tar.xz
##################
# init vars

all: dist/$(OUTPUT_TARBALL)

dist/$(OUTPUT_TARBALL): $(S)/$(OUTPUT_TARBALL)
	@mkdir -p dist
	cp -f $^ $@

$(S)/$(OUTPUT_TARBALL): $(DOWNLOADED_TARBALL)
	tar -xzvf $(DOWNLOADED_TARBALL)
	cd $(S) && $(MKT) $(PN)-$(PV)

$(DOWNLOADED_TARBALL):
	@wget $(DOWNLOAD_URL) -O $@

clean:
	rm $(DOWNLOADED_TARBALL)
	rm -r $(S)

.PHONY: all clean
