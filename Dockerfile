################
FROM google/dart:2.10 as build

WORKDIR /app
COPY pubspec.yaml /app/pubspec.yaml
RUN dart pub get
COPY . .
RUN dart pub get --offline

#RUN dart pub run build_runner build --delete-conflicting-outputs
RUN dart compile exe bin/server.dart -o bin/server.exe

########################
FROM subfuzion/dart:slim
COPY --from=build /app/bin/server.exe /app/bin/server.exe
EXPOSE 8080
ENTRYPOINT ["/app/bin/server.exe"]