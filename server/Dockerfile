FROM google/dart
WORKDIR /server
COPY ./common /common
COPY ./server /server
RUN dart pub get  
RUN  dart compile exe bin/server.dart -o bin/server
ENTRYPOINT [ "/bin/server" ]