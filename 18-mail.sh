#!/usr/bin/env bash
set -euo pipefail

TO_ADDRESS=${1:-}
SUBJECT=${2:-}
ALERT_TYPE=${3:-}
MESSAGE_BODY=${4:-}
IP_ADDRESS=${5:-}
TO_TEAM=${6:-}

TMP_TEMPLATE=$(mktemp)
TMP_FINAL=$(mktemp)
trap 'rm -f "$TMP_TEMPLATE" "$TMP_FINAL"' EXIT

# Read template into tmp (assumed to contain __MESSAGE__, __TO_TEAM__, __ALERT_TYPE__, __IP_ADDRESS__)
cp template.html "$TMP_TEMPLATE"

# Use perl to replace placeholders safely (handles multiline)
perl -0777 -pe '
  my $msg = $ENV{"MESSAGE_BODY"};
  $msg =~ s!\\!\\\\!g;   # escape backslashes
  $msg =~ s!\$!\\$!g;    # escape dollar signs
  s/__MESSAGE__/$msg/g;
  s/__TO_TEAM__/$ENV{"TO_TEAM"}/g;
  s/__ALERT_TYPE__/$ENV{"ALERT_TYPE"}/g;
  s/__IP_ADDRESS__/$ENV{"IP_ADDRESS"}/g;
' > "$TMP_FINAL"

# Send with headers
{
  echo "To: $TO_ADDRESS"
  echo "Subject: $SUBJECT"
  echo "MIME-Version: 1.0"
  echo "Content-Type: text/html; charset=UTF-8"
  echo
  cat "$TMP_FINAL"
} | msmtp -- "$TO_ADDRESS"
