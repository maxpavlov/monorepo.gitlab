@echo off
setlocal
pushd %~dp0
set header="PRIVATE_TOKEN: %PRIVATE_TOKEN%"
set header_delayed="PRIVATE_TOKEN: !PRIVATE_TOKEN!"
echo header is '%header%'
echo header_delayed is '%header_delayed%'
set url="%CI_SERVER_URL%/api/v4/projects/%CI_PROJECT_ID%/pipelines?status=success&ref=%CI_COMMIT_REF_NAME%"
curl -H %header% -s %url% | jq -r -f jq.filter > .LAST_GREEN_COMMIT
set /P commit=<.LAST_GREEN_COMMIT
echo Last green commit is '%commit%'.
popd
endlocal
