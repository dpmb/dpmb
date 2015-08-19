DEFAULTDEPENDENCIES=*.txt */*.txt */*/*.txt Makefile
DEFAULTOPTIONS=-L debian-paketmanagement.txt
DOCTORDEFAULTOPTIONS=-a experimental -a toc -a toclevels=4 debian-paketmanagement.txt

all: html epub pdf

html debianpaketmanagement.html: $(DEFAULTDEPENDENCIES)
	a2x $(VERBOSE) -f xhtml $(DEFAULTOPTIONS)

epub debianpaketmanagement.epub: $(DEFAULTDEPENDENCIES)
	a2x $(VERBOSE) -f epub $(DEFAULTOPTIONS)

pdf debianpaketmanagement.pdf: $(DEFAULTDEPENDENCIES)
	a2x $(VERBOSE) -f pdf $(DEFAULTOPTIONS)

clean:
	rm -rvf *.html *.epub *.epub.d *.xml *.fls *.log *.pdf *.css

xmllint:
	asciidoc -d book -b docbook debian-paketmanagement.txt
	xmllint debian-paketmanagement.xml

verbose: VERBOSE=-v -v
verbose: all

asciidoctor: doctor-html

doctor-html: $(DEFAULTDEPENDENCIES)
	asciidoctor $(DOCTORDEFAULTOPTIONS)
