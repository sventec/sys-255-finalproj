#!/bin/bash

# Add a new OATH token for the given user
# Usage: ./add_oath.sh <user>

echo "HOTP/T30/6 $1 - $(openssl rand -hex 10)" >>/etc/users.oath

qrencode -t ansiutf8 "otpauth://totp/$1?secret=$(awk -F '-' '{ printf $2 }' /etc/users.oath | xxd -r -p | base32)"
