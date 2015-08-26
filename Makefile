DEFAULTDEPENDENCIES=*.txt */*.txt */*/*.txt Makefile
DEFAULTOPTIONS=-L debian-paketmanagement.txt
DOCTORDEFAULTOPTIONS=-a experimental -a toc -a toclevels=4
FORMATS=html epub pdf mobi

all: $(FORMATS)
allpure: pure$(FORMATS)

purehtml: $(DEFAULTDEPENDENCIES)
	asciidoc $(VERBOSE) debian-paketmanagement.txt

html: debian-paketmanagement.html
%.html: %.txt $(DEFAULTDEPENDENCIES)
	a2x $(VERBOSE) -f xhtml $(DEFAULTOPTIONS)

epub: debian-paketmanagement.epub
%.epub: %.txt $(DEFAULTDEPENDENCIES)
	a2x $(VERBOSE) -f epub $(DEFAULTOPTIONS)

pdf: debian-paketmanagement.pdf
%.pdf: %.txt $(DEFAULTDEPENDENCIES)
	a2x $(VERBOSE) -f pdf $(DEFAULTOPTIONS)

mobi: debian-paketmanagement.mobi
%.mobi: %.epub
	ebook-convert $< $@

lit: debian-paketmanagement.lit
%.lit: %.epub
	ebook-convert $< $@

fb2: debian-paketmanagement.fb2
%.fb2: %.epub
	ebook-convert $< $@

clean:
	rm -rvf *.html *.epub *.epub.d *.xml *.fls *.log *.pdf *.css *.tex *.mobi *.lit *.fb2

xmllint:
	asciidoc -d book -b docbook debian-paketmanagement.txt
	xmllint debian-paketmanagement.xml

verbose: VERBOSE=-v -v
verbose: all

asciidoctor: doctor-html

doctor-html: $(DEFAULTDEPENDENCIES)
	asciidoctor $(DOCTORDEFAULTOPTIONS)

deploy: allpure
	for suffix in $(FORMATS); do cp -pvf debian-paketmanagement.$$suffix deploy/; done
	cd deploy && asciidoc index.txt
