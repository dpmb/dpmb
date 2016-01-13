BASE=debian-paketmanagement
DEFAULTDEPENDENCIES=*.adoc */*.adoc */*/*.adoc Makefile version.adoc *-docinfo.xml
DEFAULTOPTIONS=-L
DOCTORDEFAULTOPTIONS=-a experimental -a toc -a toclevels=4
FORMATS=online.html allinone.html chunked epub pdf mobi

all: $(FORMATS)
html: online.html allinone.html doctor.html chunked.html

allinone.html: $(BASE).allinone.html
%.allinone.html: $(DEFAULTDEPENDENCIES)
	# There seems to be a bug in the images macro if data-uri is
	# set and images are in subdirectories. Hence we override the
	# original macros with fixed ones.
	asciidoc $(VERBOSE) -f asciidoc-macros/data-uri-fixup.conf -a data-uri -o $@ $(BASE).adoc

online.html: $(BASE).online.html
%.online.html: %.adoc $(DEFAULTDEPENDENCIES)
	a2x $(VERBOSE) -f xhtml $(DEFAULTOPTIONS) $<
	mv $(VERBOSE) $(BASE).html $@

chunked: $(BASE).chunked/index.html
%.chunked/index.html: %.adoc $(DEFAULTDEPENDENCIES)
	a2x $(VERBOSE) -f chunked $(DEFAULTOPTIONS) $<

epub: $(BASE).epub
%.epub: %.adoc $(DEFAULTDEPENDENCIES)
	a2x $(VERBOSE) -f epub $(DEFAULTOPTIONS) $<

pdf: $(BASE).pdf
%.pdf: %.adoc $(DEFAULTDEPENDENCIES)
	a2x $(VERBOSE) -f pdf $(DEFAULTOPTIONS) $<

mobi: $(BASE).mobi
%.mobi: %.epub
	ebook-convert $< $@

lit: $(BASE).lit
%.lit: %.epub
	ebook-convert $< $@

fb2: $(BASE).fb2
%.fb2: %.epub
	ebook-convert $< $@

clean: deployclean
	rm -rvf version.adoc *.html *.epub *.epub.d $(BASE).xml *.fls *.log *.pdf *.css *.tex *.mobi *.lit *.fb2 $(BASE).chunked

deployclean:
	rm -rvf deploy/*/ deploy/$(BASE)* deploy/*.html

xmllint:
	asciidoc -d book -b docbook $(BASE).adoc
	xmllint $(BASE).xml

verbose: VERBOSE=-v -v
verbose: all

doctor.html: $(BASE).doctor.html
%.doctor.html: $(DEFAULTDEPENDENCIES)
	asciidoctor $(DOCTORDEFAULTOPTIONS) -o $@ $(BASE).adoc

version.adoc: debian-paketmanagement.adoc *-docinfo.xml */*.adoc */*/*.adoc Makefile
	echo ":revdate: "`date '+%FT%T%:z'` > version.adoc
	echo -n ":revnumber: " >> version.adoc; \
	if [ -d .git ] && `which git >/dev/null`; then \
	    git describe --tags --always >> version.adoc; \
	elif [ -d debian/changelog ] && `which dpkg-parsechangelog >/dev/null`; then \
	    dpkg-parsechangelog | fgrep Version | awk '{print $$2}' >> version.adoc; \
	fi

test: test-epub
test-epub: $(BASE).epub
	epubcheck $(BASE).epub

# Formerly used for divshot.io, but rather generic
deploy: all version.adoc
	for suffix in $(FORMATS); do cp -pvfr $(BASE).$$suffix deploy/; done
	for i in `find . -name '*.png' -not -path './deploy/*'`; do \
	    mkdir -pv `dirname "deploy/$$i"`; \
	    cp -pv "$$i" "deploy/$$i"; \
	done
	cd deploy && asciidoc index.adoc
