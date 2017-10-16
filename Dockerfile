FROM microsoft/dotnet
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get -y install nodejs
RUN useradd user -G root -d /home
RUN mkdir /function
RUN chmod 775 /root -R
RUN npm -g i azure-functions-core-tools@core
RUN mv /root/.azurefunctions/bin/workers/node /root/.azurefunctions/bin/workers/Node
EXPOSE 7071
WORKDIR /function
ENTRYPOINT [ "func", "host"]
CMD [ "start" ]