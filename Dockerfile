FROM mcr.microsoft.com/windows/servercore:ltsc2019

WORKDIR /opt/scrutiny

RUN Set-ExecutionPolicy Bypass -Scope Process -Force; \
 [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]'Tls,Tls11,Tls12'; \
 iex ((New-Object System.Net.WebClient).DownloadString("https://chocolatey.org/install.ps1"));

RUN choco install smartmontools -y
RUN smartctl --help