#!/bin/bash

pkgdir=$(readlink -f $(dirname $(which brave))/../package)
exec ${pkgdir}/brave "$@"
