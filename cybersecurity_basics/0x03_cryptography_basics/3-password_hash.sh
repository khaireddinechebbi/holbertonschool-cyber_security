#!/bin/bash
SALT=$(openssl rand -hex 8)
COMBINED="$1$SALT"
echo -n "$COMBINED" | openssl dgst -sha512 | sed 's/SHA2-512/SHA512/' > 3_hash.txt