export APP_LNSWAP_API_IP="10.21.21.88"
export APP_LNSWAP_API_PORT="9008"
export APP_LNSWAP_DASHBOARD_IP="10.21.21.89"
export APP_LNSWAP_DASHBOARD_PORT="9009"

#!/usr/bin/env bash

CONFIG="${UMBREL_ROOT}/app-data/lnswap/data/boltz.conf"

CERT="${UMBREL_ROOT}/app-data/lightning/data/lnd/tls.cert"
MACAROON="${UMBREL_ROOT}app-data/lightning/data/lnd/data/chain/bitcoin/${APP_BITCOIN_NETWORK}/admin.macaroon"

set -e

     sed -i  -e "s@CERT-PATH@$CERT@" \
             -e "s@MACROON-PATH@$MACAROON@" "$CONFIG"