PROG=	ksh

DESTDIR?=/usr/local/
BINDIR?=bin
MANDIR?=man

KSHDIR=	../../ksh

SRCS=	alloc.c c_ksh.c c_sh.c c_test.c c_ulimit.c edit.c emacs.c eval.c \
	exec.c expr.c history.c io.c jobs.c lex.c mail.c main.c mknod.c \
	misc.c path.c shf.c syn.c table.c trap.c tree.c tty.c var.c \
	version.c vi.c
SRCS+=	posix_signals.c
LIBS=	libbsd

DEFS=	-D_GNU_SOURCE -Wall -Wno-unused-result -Wno-unused-but-set-variable -Wno-pointer-sign -Werror
CFLAGS+=${DEFS} -I.. `pkg-config --cflags ${LIBS}`
LDADD+= `pkg-config --libs ${LIBS}`

MAN=	${PROG}.1
LINK=	rksh
MLINK=	${LINK}.1

.PHONY: build
build: patch ${PROG}

PATCHEDFILE = $(KSHDIR)/patched

.PHONY: patch
patch: $(PATCHEDFILE)
$(PATCHEDFILE):
	patch -p0 < ../linux.diff
	touch $@

.PHONY: install install-bin install-man
install: install-bin install-man

install-bin:
	install -m 755 -d $(DESTDIR)$(BINDIR)
	install -m 755 ${PROG} $(DESTDIR)$(BINDIR) 
	ln -sf $(DESTDIR)$(BINDIR)/$(PROG) $(DESTDIR)$(BINDIR)/$(LINK)

install-man:
	install -m 755 -d $(DESTDIR)$(MANDIR)/man1 
	install -m 644 $(KSHDIR)/$(MAN) $(DESTDIR)$(MANDIR)/man1
	ln -sf $(DESTDIR)$(MANDIR)/man1/$(MAN) $(DESTDIR)$(MANDIR)/man1/$(MLINK)

.PHONY: clean
clean:
	rm -f ${PROG} ${OBJS}

OBJS = ${SRCS:.c=.o}
${PROG}: ${OBJS}
	${CC} ${LDFLAGS} -o $@ $^ ${LDADD}

VPATH = ../../ksh:..

check test:
	/usr/bin/perl ${.CURDIR}/tests/th -s ${.CURDIR}/tests -p ./ksh -C \
	    pdksh,sh,ksh,posix,posix-upu
