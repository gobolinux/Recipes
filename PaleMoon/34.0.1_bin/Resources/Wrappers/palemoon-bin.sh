#!/bin/bash
# Pale Moon launcher wrapper (based on Firefox wrapper)
# Find the package directory dynamically
pkgdir=$(readlink -f $(dirname $(which palemoon))/../package)
exec ${pkgdir}/palemoon "$@"
