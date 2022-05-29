FROM mcr.microsoft.com/windows/servercore:ltsc2019

WORKDIR /opt/scrutiny

ENV chocolateyUseWindowsCompression false

RUN powershell -Command \
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco feature disable --name showDownloadProgress
RUN choco install smartmontools -y
RUN smartctl --help
COPY scrutiny-collector-metrics.exe scrutiny-collector-metrics.exe

RUN ./scrutiny-collector-metrics.exe --help