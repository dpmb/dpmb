BASE=debian-paketmanagement
DEFAULTDEPENDENCIES=*.txt */*.txt */*/*.txt Makefile version.txt *-docinfo.xml
DEFAULTOPTIONS=-L
DOCTORDEFAULTOPTIONS=-a experimental -a toc -a toclevels=4
FORMATS=html epub pdf mobi

all: $(FORMATS)
allpure: pure$(FORMATS)

purehtml: $(DEFAULTDEPENDENCIES)
	asciidoc $(VERBOSE) $(BASE).txt

html: $(BASE).html
%.html: %.txt $(DEFAULTDEPENDENCIES)
	a2x $(VERBOSE) -f xhtml $(DEFAULTOPTIONS) $<

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

clean:
	rm -rvf version.txt *.html *.epub *.epub.d $(BASE).xml *.fls *.log *.pdf *.css *.tex *.mobi *.lit *.fb2

xmllint:
	asciidoc -d book -b docbook $(BASE).txt
	xmllint $(BASE).xml

verbose: VERBOSE=-v -v
verbose: all

asciidoctor: doctor-html

doctor-html: $(DEFAULTDEPENDENCIES)
	asciidoctor $(DOCTORDEFAULTOPTIONS) $(BASE).txt

version.txt: debian-paketmanagement.txt *-docinfo.xml */*.txt */*/*.txt Makefile
	echo ":revdate: "`date '+%F'` > version.txt
	echo -n ":revnumber: " >> version.txt; \
	if [ -d .git ] && `which git >/dev/null`; then \
	    git describe --tags --always >> version.txt; \
	elif [ -d debian/changelog ] && `which dpkg-parsechangelog >/dev/null`; then \
	    dpkg-parsechangelog | fgrep Version | awk '{print $2}' >> version.txt; \
	fi

test: test-epub
test-epub: $(BASE).epub
	epubcheck $(BASE).epub

deploy: allpure version.txt
	for suffix in $(FORMATS); do cp -pvf $(BASE).$$suffix deploy/; done
	cd deploy && asciidoc index.txt
