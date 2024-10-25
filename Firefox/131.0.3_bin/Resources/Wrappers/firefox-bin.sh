#!/bin/bash

pkgdir=$(readlink -f $(dirname $(which firefox))/../package)
exec ${pkgdir}/firefox "$@"
