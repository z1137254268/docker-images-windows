@echo off

docker history cirrusci/windowsservercore:2019
docker history cirrusci/windowsservercore:visualstudio2019
docker history cirrusci/windowsservercore:cmake

IF not "%CIRRUS_BRANCH%" == "master" GOTO NOTMASTER
:YESPATH

docker login --username "%DOCKER_USER_NAME%" --password "%DOCKER_PASSWORD%"
docker push --all-tags cirrusci/windowsservercore

GOTO END
:NOTMASTER

@ECHO Not a master build. Nothing to push!

GOTO END
:END
