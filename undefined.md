# Book "Debian Package Management" / Buch "Debian-Paketmanagement"

 [![Build Status](https://travis-ci.org/dpmb/dpmb.svg?branch=master)](https://travis-ci.org/dpmb/dpmb)

## English

This is the freely available source code for the \(for now German written\) [book Debian Package Management](https://www.dpmb.org/) by [Axel Beckert](https://axel.beckert.ch/) and [Frank Hofmann](http://www.efho.de/).

The book is written in [AsciiDoc](https://asciidoc.org/) format and can be rendered to e.g. HTML, EPUB, PDF, or Mobipocket using [AsciiDoc](https://asciidoc.org/) or [Asciidoctor](https://asciidoctor.org/), and [DocBook to LaTeX Publishing \(dblatex\)](http://dblatex.sourceforge.net/) and [Calibre](https://calibre-ebook.com/)'s `ebook-convert`.

It has been written at [many different locations](https://www.dpmb.org/karte/).

### License

The book "Debian Package Management" by [Frank Hofmann and Axel Beckert](https://www.dpmb.org/) is licensed under the [Creative Commons Attribution - Share Alike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).

### Read or Download the Book

You can also [read it online](https://book.dpmb.org/debian-paketmanagement.chunked/index.html) or download as either [single HTML file including all images](https://book.dpmb.org/debian-paketmanagement.allinone.html) \(ca. 12 MB\) or as [PDF](https://book.dpmb.org/debian-paketmanagement.pdf) \(ca. 10 MB\), [EPUB](https://book.dpmb.org/debian-paketmanagement.epub) \(ca. 9 MB\) or [Mobipocket](https://book.dpmb.org/debian-paketmanagement.mobi) \(ca. 15 MB\) file from [https://book.dpmb.org/](https://book.dpmb.org/). The book is also [available as package in Debian](https://packages.debian.org/stable/debian-paketmanagement-buch) in Debian 9 Stretch or later.

Additionally, the book is also available [online at GitBook](https://gitbook.dpmb.org/), but be aware that the rendering over there at [Gitbook](https://www.gitbook.com/) still contains quite some bugs, i.e. neither references nor images work properly yet and there are superfluous table of contents at chapter starts. The downloadable [PDF](https://www.gitbook.com/download/pdf/book/dpmb/dpmb) and [EPUB](https://www.gitbook.com/download/epub/book/dpmb/dpmb) variants at Gitbook suffer from the same symptoms, too.

## German / Deutsch

Dies ist der frei verfügbare Quelltext zum [Buch Debian-Paketmanagement](https://www.dpmb.org/) von [Axel Beckert](https://axel.beckert.ch/) und [Frank Hofmann](http://www.efho.de/).

Das Buch ist im [AsciiDoc](https://asciidoc.org/)-Format geschrieben und kann mit [AsciiDoc](https://asciidoc.org/) oder [Asciidoctor](https://asciidoctor.org/), und je nach Format via [DocBook to LaTeX Publishing \(dblatex\)](http://dblatex.sourceforge.net/) und [Calibre](https://calibre-ebook.com/)s `ebook-convert` nach z.B. HTML, EPUB, PDF und Mobipocket gerendert werden.

Es wurde an [vielen verschiedenen Orten](https://www.dpmb.org/karte/) geschrieben.

### Lizenz

Das Buch "Debian-Paketmanagement" von [Frank Hofmann und Axel Beckert](https://www.debian-paketmanagement.de/) ist lizenziert unter einer [Creative Commons Namensnennung - Weitergabe unter gleichen Bedingungen 4.0 International Lizenz](https://creativecommons.org/licenses/by-sa/4.0/).

### Das Buch lesen oder herunterladen

Man kann das Buch auch [online lesen](https://book.dpmb.org/debian-paketmanagement.chunked/index.html) oder von [https://book.dpmb.org/](https://book.dpmb.org/) als [einzelne HTML-Datei mitsamt allen Bildern](https://book.dpmb.org/debian-paketmanagement.allinone.html) \(ca. 12 MB\), als [PDF](https://book.dpmb.org/debian-paketmanagement.pdf) \(ca. 10 MB\), als [EPUB](https://book.dpmb.org/debian-paketmanagement.epub) \(ca. 9 MB\) oder als [Mobipocket](https://book.dpmb.org/debian-paketmanagement.mobi) \(ca. 15 MB\) herunterladen.

Zusätzlich gibt's das Buch auch [online bei GitBook](https://gitbook.dpmb.org/), aber das Rendering bei [Gitbook](https://www.gitbook.com/) hat leider einige Probleme. So funktionieren aktuell weder Referenzen noch Bilder und es hat überflüssige Zusatzinhaltsverzeichnisse am Start einiger Kapitel. Die herunterladbaren [PDF](https://www.gitbook.com/download/pdf/book/dpmb/dpmb)- und [EPUB](https://www.gitbook.com/download/epub/book/dpmb/dpmb)-Varianten von Gitbook sind von denselben Problemen betroffen.

### Klappentext

> Die Debian-Distribution setzt sich aus mehreren zehntausend Bausteinen zusammen, die alle aufeinander abgestimmt sind und sich bei Bedarf in eine Installation integrieren. Diese sogenannten Pakete \(Packages\) sind so eigenständig, dass sie von einem oder mehreren Debian-Entwicklern für das Debian-Projekt gepflegt werden, interagieren aber zugleich so intensiv mit allen anderen, dass wechselseitige Abhängigkeiten erkannt und bei Bedarf automatisch aufgelöst werden. Nur so ist die Modularität des komplexen Gesamtsystems gewährleistet, die Administratoren weltweit die Möglichkeit bietet, Debian-Installationen sehr genau für die jeweilige Anforderung vom Embedded-Gerät über den Desktop bis zum Großrechner zu konfigurieren.
>
> Effizientes Paketmanagement ist also für jeden Debian-Administrator ein ebenso interessantes wie lohnendes Feld, das in der Praxis aber oft nicht ausreichend beachtet und mit wenigen Standardbefehlen "erledigt" wird. Zwei ausgewiesene Debian-Experten nehmen dies zum Anlass, das Debian-Paketmanagement erstmals derart umfassend darzustellen. Das Buch kommt von den Konzepten, die der Struktur und dem Zusammenspiel der Pakete zugrunde liegen, über die Werkzeuge zu deren Nutzung immer auch zu den Best Practices der professionellen Systemadministration. Es wendet sich an Einsteiger ebenso wie an Berufsadministratoren, indem es, ausgehend von den Grundlagen, das Optimierungspotential in zunehmend umfangreichen Szenarien ausschöpft. So entsteht ein aktuelles Handbuch der Debian-Administration, das als praxisorientiertes HowTo ebenso dient wie als Nachschlagewerk für die unerwartet zahlreichen Optionen und Kombinationsmöglichkeiten.

### Bau-Anleitung

#### Alle notwendigen Pakete installieren und das Git-Repository klonen

Zuerst sollten mit Root-Rechten \(z.B. via `sudo`, `su` oder `ssh root@…`\) alle zum Bau notwendigen Abhängigkeiten installiert werden:

```bash
apt-get install asciidoc dblatex texlive-lang-german xmlto calibre
```

\(Hinweis für Gentoo-Nutzer: Es gibt ein [Gentoo-Overlay für dblatex](https://gpo.zugaina.org/app-text/dblatex).\)

Dann als Benutzer das entsprechende Git-Repository klonen und ins entsprechende Verzeichnis wechseln:

```bash
git clone https://github.com/dpmb/dpmb.git
cd dpmb
```

#### Alle E-Book-Formate bauen

Will man alle verfügbaren E-Book-Formate bauen reicht nun ein simples

```bash
make
```

#### Nur eines der E-Book-Formate bauen

Will man nur eines der Formate bauen, so reicht einer dieser Befehle:

```bash
make allinone.html
make online.html
make chunked
make doctor.html
make pdf
make epub
make mobi
```

* `allinone.html` = Einzelne HTML-Datei mit allen Bildern eingebettet
* `online.html` = HTML-Datei mit allen Bildern als eigene Dateien
* `chunked` = Eine HTML-Datei pro Kapitel
* `doctor.html` = HTML-Datei mit allen Bildern als eigene Dateien

  \(mit `asciidoctor` statt `asciidoc`/`a2x` gerendert\).

#### .deb-Paket bauen und installieren

Will man das ganze gleich als Debian-Paket bauen und installieren, so ruft man in o.g. Verzeichnis als Benutzer anstatt `make` folgenden Befehl \(aus dem Paket `dpkg-dev`, das Paket `build-essential` muss auch installiert sein\) ein:

```bash
dpkg-buildpackage -b
```

Das fertige Paket liegt danach unter `../debian-paketmanagement-buch_…_all.deb` und man kann es mit Root-Rechten \(siehe oben\) entsprechend installieren, z.B. mittels `sudo`:

```bash
sudo dpkg -i ../debian-paketmanagement-buch_*_all.deb
```

