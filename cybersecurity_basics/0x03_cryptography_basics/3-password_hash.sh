#!/bin/bash
echo -n $1$(openssl rand -hex 8) | openssl dgst -sha512 | sed 's/SHA2-512/SHA512/' > 3_hash.txt