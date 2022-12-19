#!/usr/bin/env bash
set -Eeuo pipefail

# initialize Exitcode variable
EXITCODE=0

die() {
    echo "$1"
    exit 1
}

test -z $PROWLER_RULES_EXCLUDED && die "PROWLER_RULES_EXCLUDED not set!"
test -z $AWS_REGION && die "AWS_REGION not set!"
test -z $PROWLER_OUTPUT_FORMATS && die "PROWLER_OUTPUT_FORMATS not set!"
test -z $PROWLER_REPORT_BUCKET_PATH && die "PROWLER_REPORT_BUCKET_PATH not set!"
test -z $PROWLER_WHITELIST && die "PROWLER_WHITELIST not set!"

# print out environment variables for debug
printenv

# run prowler
/prowler/prowler -E "${PROWLER_RULES_EXCLUDED}" -r "${AWS_REGION}" -f "${AWS_REGION}" -M "${PROWLER_OUTPUT_FORMATS}" -D "${PROWLER_REPORT_BUCKET_PATH}" -w "${PROWLER_WHITELIST}" || EXITCODE=$?

# Exit with 0 if successful, otherwise with return code from prowler command
exit "$EXITCODE"
