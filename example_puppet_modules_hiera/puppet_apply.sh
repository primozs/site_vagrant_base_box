#!/bin/bash

basedir="$( dirname $( readlink -f "${0}" ) )"

## required for the relative datadir path in hiera.yaml
cd ${basedir}/puppet

exec sudo puppet apply \
    --hiera_config ${basedir}/puppet/hiera.yaml \
    --modulepath "${basedir}/puppet/modules:${basedir}/puppet/modules42:${basedir}/puppet/modules_plab" \
    ${basedir}/puppet/manifests/travelslo.pp