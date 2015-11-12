# $Id: Makefile,v 1.2 2002/11/10 23:12:21 per Exp $

# ---- inställningar ----

PROGRAM = stp-mirror
VERSION = 0.1
PV      = $(PROGRAM)-$(VERSION)

ifeq ($(shell id -u),0)
    BASE?=/usr/local
else
    BASE?=$(HOME)
endif

BINDIR ?= $(BASE)/bin

ifeq ($(shell id -u),0)
    PERLLIBDIR ?= $(BASE)/lib/site_perl
else
    PERLLIBDIR ?= $(BASE)/lib/perl5
endif

# INSTALL_PREFIX kan användas om mappen filen ska kopieras till är en
# annan än den kommer läsas från, t.ex för debian-installation till paket
ifdef DESTDIR
    export INSTALL_PREFIX=$(DESTDIR)
endif

# ---- filer ----

BIN     = $(addprefix build-tmp/,stp-mirror)
OBJ     = $(BIN) $(PERLLIB)
TMP     = build-tmp

# ---- beroenden ----

.PHONY : default build install clean
default : build

build-tmp/% : % build-tmp Makefile
	perl -pwe "s|_VERSION_|$(PV)|g;s|.*USELIB.*|use lib '$(PERLLIBDIR)';|;" < $< > $@

$(TMP) :
	mkdir -p $@

# ---- kommandon ----

build : $(OBJ)
    ifdef SUB
	for I in $(SUB);do (cd $$I && $(MAKE) build);done
    endif

clean :
    ifdef OBJ
	rm $(OBJ)
    endif
	rm -rf $(TMP)
    ifdef SUB
	for I in $(SUB);do (cd $$I && $(MAKE) clean);done
    endif

install : build
    ifdef BIN
	install -d $(INSTALL_PREFIX)$(BINDIR)
	install -m 755 $(BIN) $(INSTALL_PREFIX)$(BINDIR)
    endif
    ifdef MAN1
	install -d $(INSTALL_PREFIX)$(MANDIR)/man1
	install -m 644 $(MAN1) $(INSTALL_PREFIX)$(MANDIR)/man1
    endif
    ifdef PERLLIB
	scripts/pm-install -m 644 $(PERLLIB) $(INSTALL_PREFIX)$(PERLLIBDIR)
    endif
    ifdef SUB
	for I in $(SUB);do (cd $$I && $(MAKE) install);done
    endif
