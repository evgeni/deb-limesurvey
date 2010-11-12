#!/bin/sh

TTFFILE="$1"
DESTDIR="$2"

CURDIR=$( pwd )

TTF2AFM="/usr/bin/ttf2afm"
MAKEFONT="$CURDIR/admin/classes/tcpdf/fonts/utils/makefont.php"
ENC="$CURDIR/admin/classes/tcpdf/fonts/utils/enc"

BASENAME=$( basename "$TTFFILE" )
AFMFILE="${BASENAME%.*}.afm"

ln -s "$ENC" "$DESTDIR/enc"
cd "$DESTDIR"

$TTF2AFM "$TTFFILE" -o "$AFMFILE"
php -q "$MAKEFONT" "$TTFFILE" "$AFMFILE"
rm "$AFMFILE"
rm enc
