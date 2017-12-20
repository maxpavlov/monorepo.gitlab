@echo off
setlocal
set url="%CI_SERVER_URL%/api/v4/projects/%CI_PROJECT_ID%/pipelines?private_token=%PRIVATE_TOKEN%&ref=%CI_COMMIT_REF_NAME%&status=success"
pushd %~dp0
curl %url%
pause
curl -s %url% | jq -r -f jq.filter > .LAST_GREEN_COMMIT
set /P commit=<.LAST_GREEN_COMMIT
echo Last green commit is '%commit%'.
popd
endlocal