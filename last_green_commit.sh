#!/bin/bash
DIRNAME="$(dirname $(readlink -f "$0"))"
pushd ${DIRNAME}
urlToCall="${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/pipelines?status=success&ref=${CI_COMMIT_REF_NAME}"
echo "URL to call is: ${urlToCall}"
curl --header "${header}" -s "${urlToCall}" -o tmp
jq -r -f jq.filter < tmp > .LAST_GREEN_COMMIT
echo "Last green commit is"
cat .LAST_GREEN_COMMIT
rm tmp
popd
