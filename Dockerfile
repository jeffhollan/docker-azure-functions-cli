FROM microsoft/dotnet
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get -y install nodejs
RUN useradd user -G root -d /home
RUN mkdir /function
RUN chown user:root /home -R && chown user:root /usr -R && chown user:root /function
USER user
RUN npm -g i azure-functions-core-tools@core
RUN mv /home/.azurefunctions/bin/workers/node /home/.azurefunctions/bin/workers/Node
EXPOSE 7071
WORKDIR /function
ENTRYPOINT [ "func", "host"]
CMD [ "start" ]