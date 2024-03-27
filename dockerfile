FROM mcr.microsoft.com/mssql/server:2019-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=YourStrong!Passw0rd

COPY init.sql /init.sql
COPY cattle.csv /cattle.csv

RUN /opt/mssql/bin/sqlservr --accept-eula & sleep 60 \
    && cat /var/opt/mssql/log/errorlog \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'YourStrong!Passw0rd' >
    && pkill sqlservr
