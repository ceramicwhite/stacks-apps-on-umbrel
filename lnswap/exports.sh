export APP_LNSWAP_API_IP="10.21.21.88"
export APP_LNSWAP_API_PORT="9008"
export APP_LNSWAP_APP_IP="10.21.21.89"
export APP_LNSWAP_APP_PORT="9010"


#!/usr/bin/env bash

CONFIG="${UMBREL_ROOT}/app-data/stacks-lnswap/data/boltz.conf"

CERT="${UMBREL_ROOT}/app-data/lightning/data/lnd/tls.cert"
MACAROON="${UMBREL_ROOT}app-data/lightning/data/lnd/data/chain/bitcoin/${APP_BITCOIN_NETWORK}/admin.macaroon"

set -e

     sed -i  -e "s@CERT-PATH@$CERT@" \
             -e "s@MACAROON-PATH@$MACAROON@" "$CONFIG"