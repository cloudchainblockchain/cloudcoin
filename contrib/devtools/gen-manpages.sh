#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

CLOUDCOIND=${BITCOIND:-$BINDIR/cloudcoind}
CLOUDCOINCLI=${BITCOINCLI:-$BINDIR/cloudcoin-cli}
CLOUDCOINTX=${BITCOINTX:-$BINDIR/cloudcoin-tx}
CLOUDCOINQT=${BITCOINQT:-$BINDIR/qt/cloudcoin-qt}

[ ! -x $CLOUDCOIND ] && echo "$CLOUDCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
LTCVER=($($CLOUDCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for bitcoind if --version-string is not set,
# but has different outcomes for bitcoin-qt and bitcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$CLOUDCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $CLOUDCOIND $CLOUDCOINCLI $CLOUDCOINTX $CLOUDCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${LTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${LTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
