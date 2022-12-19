#!/usr/bin/env bash
set -Eeuo pipefail

die() {
    echo "$1"
    exit 1
}

test -z $PROWLER_RULES_EXCLUDED && die "PROWLER_RULES_EXCLUDED not set!"
test -z $AWS_REGION && die "AWS_REGION not set!"
test -z $PROWLER_OUTPUT_FORMATS && die "PROWLER_OUTPUT_FORMATS not set!"
test -z $PROWLER_REPORT_BUCKET && die "PROWLER_REPORT_BUCKET not set!"
test -z $PROWLER_WHITELIST && die "PROWLER_WHITELIST not set!"


printenv
/prowler/prowler -E "${PROWLER_RULES_EXCLUDED}" -r "${AWS_REGION}" -f "${AWS_REGION}" -M "${PROWLER_OUTPUT_FORMATS}" -D "${PROWLER_REPORT_BUCKET}" -w "${PROWLER_WHITELIST}"
