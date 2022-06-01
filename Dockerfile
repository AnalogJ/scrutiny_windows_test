ARG WINDOWS_IMAGE_TAG
FROM mcr.microsoft.com/windows/servercore:${WINDOWS_IMAGE_TAG}

WORKDIR /opt/scrutiny/bin/

ENV chocolateyUseWindowsCompression false

RUN powershell -Command \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco feature disable --name showDownloadProgress
RUN choco install smartmontools -y
RUN smartctl --help

COPY scrutiny-web-windows-4.0-amd64.exe /opt/scrutiny/bin/scrutiny-web-windows-4.0-amd64.exe

#RUN powershell /opt/scrutiny/download-latest-release-asset.ps1 "scrutiny-collector-metrics-windows-4.0-amd64.exe"

RUN /opt/scrutiny/bin/scrutiny-collector-metrics-windows-4.0-amd64.exe --help