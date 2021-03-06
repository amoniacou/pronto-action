#!/bin/sh

cd ${GITHUB_WORKSPACE}

# Action Inputs
export GITHUB_TOKEN=${INPUT_GITHUB_TOKEN}
export COMMIT=${INPUT_COMMIT:-origin/master}
export RUNNER=${INPUT_RUNNER:-rubocop}
export FORMATTERS=${INPUT_FORMATTERS:-github_status github_pr}

export PRONTO_PULL_REQUEST_ID="$(jq --raw-output .number "${GITHUB_EVENT_PATH}")"
export PRONTO_GITHUB_ACCESS_TOKEN="${GITHUB_TOKEN}"
COMMAND="pronto run -c ${COMMIT} -r ${RUNNER} -f ${FORMATTERS}"
echo "PRONTO_PULL_REQUEST_ID: ${PRONTO_PULL_REQUEST_ID}"
echo "COMMAND: ${COMMAND}"
$COMMAND
