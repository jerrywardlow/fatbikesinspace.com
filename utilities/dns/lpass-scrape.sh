#!/usr/bin/env sh

eval "$(jq -r '@sh "PROJECT=\(.project)"')"

# Check if logged in to LastPass
if ! lpass status | grep -q "Logged in as " ; then
    echo " " >&2
    echo " " >&2
    echo "Please login to LastPass CLI" >&2
    echo "EXAMPLE" >&2
    echo "    $ lpass login username@example.com" >&2
    exit 1
fi

KEY_NAME=$(lpass show "$PROJECT/DNS - Access Key" --name)
KEY_ALGORITHM=$(lpass show "$PROJECT/DNS - Access Key" --algorithm)
KEY_SECRET=$(lpass show "$PROJECT/DNS - Access Key" --secret)

jq -n --arg key_name "$KEY_NAME" --arg key_algorithm "$KEY_ALGORITHM" --arg key_secret "$KEY_SECRET" '{"key_name":$key_name, "key_algorithm":$key_algorithm, "key_secret":$key_secret}'
