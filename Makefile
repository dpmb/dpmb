all: html epub pdf

html debianpaketmanagement.html: *.txt */*.txt */*/*.txt Makefile
	asciidoc -a toc -a toclevels=3 debian-paketmanagement.txt

epub debianpaketmanagement.epub: *.txt */*.txt */*/*.txt Makefile
	a2x -L -f epub debian-paketmanagement.txt

pdf debianpaketmanagement.pdf: *.txt */*.txt */*/*.txt Makefile
	a2x -L -f pdf debian-paketmanagement.txt

clean:
	rm -rvf *.html *.epub *.epub.d debian-paketmanagement.xml *.fls *.log debian-paketmanagement.pdf

xmllint:
	asciidoc -a toc -a toclevels=3 -d book -b docbook debian-paketmanagement.txt
	xmllint debian-paketmanagement.xml
