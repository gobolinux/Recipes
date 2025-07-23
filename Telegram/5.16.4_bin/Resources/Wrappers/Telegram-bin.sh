#!/bin/bash

pkgdir=$(readlink -f $(dirname $(which Telegram))/../package)
exec Runner ${pkgdir}/Telegram "$@"
