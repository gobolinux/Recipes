#!/bin/bash

pkgdir=$(readlink -f $(dirname $(which v2ray))/../package)
exec ${pkgdir}/v2ray "$@"
