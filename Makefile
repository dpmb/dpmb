BASE=debian-paketmanagement
DEFAULTDEPENDENCIES=*.txt */*.txt */*/*.txt Makefile version.txt *-docinfo.xml
DEFAULTOPTIONS=-L
DOCTORDEFAULTOPTIONS=-a experimental -a toc -a toclevels=4
FORMATS=online.html allinone.html epub pdf mobi

all: $(FORMATS)
html: online.html allinone.html doctor.html

allinone.html: $(BASE).allinone.html
%.allinone.html: $(DEFAULTDEPENDENCIES)
	# There seems to be a bug in the images macro if data-uri is
	# set and images are in subdirectories. Hence we override the
	# original macros with fixed ones.
	asciidoc $(VERBOSE) -f asciidoc-macros/data-uri-fixup.conf -a data-uri -o $@ $(BASE).txt

online.html: $(BASE).online.html
%.online.html: %.txt $(DEFAULTDEPENDENCIES)
	a2x $(VERBOSE) -f xhtml $(DEFAULTOPTIONS) $<
	mv $(VERBOSE) $(BASE).html $@

epub: $(BASE).epub
%.epub: %.txt $(DEFAULTDEPENDENCIES)
	a2x $(VERBOSE) -f epub $(DEFAULTOPTIONS) $<

pdf: $(BASE).pdf
%.pdf: %.txt $(DEFAULTDEPENDENCIES)
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
	rm -rvf version.txt *.html *.epub *.epub.d $(BASE).xml *.fls *.log *.pdf *.css *.tex *.mobi *.lit *.fb2

deployclean:
	rm -rvf deploy/*/ deploy/$(BASE)* deploy/*.html

xmllint:
	asciidoc -d book -b docbook $(BASE).txt
	xmllint $(BASE).xml

verbose: VERBOSE=-v -v
verbose: all

doctor.html: $(BASE).doctor.html
%.doctor.html: $(DEFAULTDEPENDENCIES)
	asciidoctor $(DOCTORDEFAULTOPTIONS) -o $@ $(BASE).txt

version.txt: debian-paketmanagement.txt *-docinfo.xml */*.txt */*/*.txt Makefile
	echo ":revdate: "`date '+%F'` > version.txt
	echo -n ":revnumber: " >> version.txt; \
	if [ -d .git ] && `which git >/dev/null`; then \
	    git describe --tags --always >> version.txt; \
	elif [ -d debian/changelog ] && `which dpkg-parsechangelog >/dev/null`; then \
	    dpkg-parsechangelog | fgrep Version | awk '{print $$2}' >> version.txt; \
	fi

test: test-epub
test-epub: $(BASE).epub
	epubcheck $(BASE).epub

deploy: all version.txt
	for suffix in $(FORMATS); do cp -pvf $(BASE).$$suffix deploy/; done
	for i in `find . -name '*.png' -not -path './deploy/*'`; do \
	    mkdir -pv `dirname "deploy/$$i"`; \
	    cp -pv "$$i" "deploy/$$i"; \
	done
	cd deploy && asciidoc index.txt
