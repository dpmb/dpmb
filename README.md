# Book "Debian Package Management" / Buch "Debian-Paketmanagement"

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License Contract" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" align="right" /></a>
[![Build Status](https://travis-ci.org/dpmb/dpmb.svg?branch=master)](https://travis-ci.org/dpmb/dpmb)

## English

This is the freely available source code for the (for now German written)
[book Debian Package Management](http://www.dpmb.org/) by
[Axel Beckert](http://axel.beckert.ch/) and
[Frank Hofmann](http://www.efho.de/).

The book is written in [AsciiDoc](http://asciidoc.org/) format and can
be rendered to e.g. HTML, EPub, PDF, or Mobipocket using
[AsciiDoc](http://asciidoc.org/) or
[Asciidoctor](http://asciidoctor.org/), and
[DocBook to LaTeX Publishing (dblatex)](http://dblatex.sourceforge.net/)
and [Calibre](http://calibre-ebook.com/)'s `ebook-convert`.

<span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" property="dct:title" rel="dct:type">The book "Debian Package Management"</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://www.dpmb.org/" property="cc:attributionName" rel="cc:attributionURL">Frank Hofmann and Axel Beckert</a> is licensed under the <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution - Share Alike 4.0 International License</a>.

## German

Dies ist der frei verfügbare Quelltext zum
[Buch Debian-Paketmanagement](http://www.dpmb.org/) von
[Axel Beckert](http://axel.beckert.ch/) und
[Frank Hofmann](http://www.efho.de/).

Das Buch ist im [AsciiDoc](http://asciidoc.org/)-Format geschrieben
und kann mit [AsciiDoc](http://asciidoc.org/) oder
[Asciidoctor](http://asciidoctor.org/), und je nach Format via
[DocBook to LaTeX Publishing (dblatex)](http://dblatex.sourceforge.net/)
und [Calibre](http://calibre-ebook.com/)s `ebook-convert` nach
z.B. HTML, EPub, PDF und Mobipocket gerendert werden.

<span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" property="dct:title" rel="dct:type">Das Buch "Debian-Paketmanagement"</span> von <a xmlns:cc="http://creativecommons.org/ns#" href="http://www.debian-paketmanagement.de/" property="cc:attributionName" rel="cc:attributionURL">Frank Hofmann und Axel Beckert</a> ist lizenziert unter einer <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Namensnennung - Weitergabe unter gleichen Bedingungen 4.0 International Lizenz</a>.

### Klappentext

> Die Debian-Distribution setzt sich aus mehreren zehntausend Bausteinen
> zusammen, die alle aufeinander abgestimmt sind und sich bei Bedarf in
> eine Installation integrieren. Diese sogenannten Pakete (Packages)
> sind so eigenständig, dass sie von einem oder mehreren
> Debian-Entwicklern für das Debian-Projekt gepflegt werden,
> interagieren aber zugleich so intensiv mit allen anderen, dass
> wechselseitige Abhängigkeiten erkannt und bei Bedarf automatisch
> aufgelöst werden. Nur so ist die Modularität des komplexen
> Gesamtsystems gewährleistet, die Administratoren weltweit die
> Möglichkeit bietet, Debian-Installationen sehr genau für die jeweilige
> Anforderung vom Embedded-Gerät über den Desktop bis zum Großrechner zu
> konfigurieren.
>
> Effizientes Paketmanagement ist also für jeden Debian-Administrator
> ein ebenso interessantes wie lohnendes Feld, das in der Praxis aber
> oft nicht ausreichend beachtet und mit wenigen Standardbefehlen
> "erledigt" wird. Zwei ausgewiesene Debian-Experten nehmen dies zum
> Anlass, das Debian-Paketmanagement erstmals derart umfassend
> darzustellen. Das Buch kommt von den Konzepten, die der Struktur und
> dem Zusammenspiel der Pakete zugrunde liegen, über die Werkzeuge zu
> deren Nutzung immer auch zu den Best Practices der professionellen
> Systemadministration. Es wendet sich an Einsteiger ebenso wie an
> Berufsadministratoren, indem es, ausgehend von den Grundlagen, das
> Optimierungspotential in zunehmend umfangreichen Szenarien
> ausschöpft. So entsteht ein aktuelles Handbuch der
> Debian-Administration, das als praxisorientiertes HowTo ebenso dient
> wie als Nachschlagewerk für die unerwartet zahlreichen Optionen und
> Kombinationsmöglichkeiten.

### Bau-Anleitung

#### Alle notwendigen Pakete installieren und das Git-Repository klonen

Zuerst sollten mit Root-Rechten (z.B. via `sudo`, `su` oder `ssh
root@…`) alle zum Bau notwendigen Abhängigkeiten installiert werden:

```sh
apt-get install asciidoc dblatex texlive-lang-german xmlto calibre
```

(Hinweis für Gentoo-Nutzer: Es gibt ein
[Gentoo-Overlay für dblatex](http://gpo.zugaina.org/app-text/dblatex).)

Dann als Benutzer das entsprechende Git-Repository klonen und ins
entsprechende Verzeichnis wechseln:

```sh
git clone git://github.com/dpmb/dpmb.git
cd dpmb
```

#### Alle E-Book-Formate bauen

Will man alle verfügbaren E-Book-Formate bauen reicht nun ein simples

```sh
make
```

#### Nur eines der E-Book-Formate bauen

Will man nur eines der Formate bauen, so reicht einer dieser Befehle:

```sh
make html
make pdf
make epub
make mobi
```

#### .deb-Paket bauen und installieren

Will man das ganze gleich als Debian-Paket bauen und installieren, so
ruft man in o.g. Verzeichnis als Benutzer anstatt `make` folgenden
Befehl (aus dem Paket `dpkg-dev`, das Paket `build-essential` muss auch
installiert sein) ein:

```sh
dpkg-buildpackage -b
```

Das fertige Paket liegt danach unter
`../debian-paketmanagement-buch_…_all.deb` und man kann es mit
Root-Rechten (siehe oben) entsprechend installieren, z.B. mittels
`sudo`:

```sh
sudo dpkg -i ../debian-paketmanagement-buch_*_all.deb
```
