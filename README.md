# dart_pub
Private pub.dev for packages Flutter Dart

# On server

```
docker-compose up
```

# Publish package

Add the ```publish_to``` property in package's pubspec.yaml

```yaml
name: my_amazing_package
description: The Package!
version: 1.0.0
author: Author<contact@example.com>
homepage: example.com

publish_to: http://your-server.com

```

Use command:
```
flutter pub publish
```

# Using in other projects

Add in package's pubspec.yaml

```yaml

dependencies:
  my_amazing_package:
    hosted:
      url: http://your-server.com
      version: ˆ1.0.0

```


