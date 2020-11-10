import 'package:unpub/unpub.dart' as unpub;

void main(List<String> args) async {
  print(args);

  var basedir = '/packages'; // Base directory to save pacakges
  var db = 'mongodb://mongo:27017/dart_pub'; // MongoDB uri

  var metaStore = unpub.MongoStore(db);
  await metaStore.db.open();

  var packageStore = unpub.FileStore(basedir);

  var app = unpub.App(
    metaStore: metaStore,
    packageStore: packageStore,
  );

  var server = await app.serve('0.0.0.0', 8080);
  print('Serving at http://${server.address.host}:${server.port}');
}
