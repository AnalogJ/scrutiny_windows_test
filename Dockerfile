FROM mcr.microsoft.com/windows/servercore:ltsc2019

WORKDIR /opt/scrutiny

COPY smartmontools-7.3-1.win32-setup.exe smartmontools-7.3-1.win32-setup.exe
RUN smartmontools-7.3-1.win32-setup.exe /HELP