import 'package:mongo_dart/mongo_dart.dart';
import 'package:unpub/unpub.dart' as unpub;

void main(List<String> args) async {
  print(args);

  var basedir = '/packages'; // Base directory to save pacakges
  var dbUrlConnection = 'mongodb://mongo:27017/dart_pub'; // MongoDB uri

  final db = Db(dbUrlConnection);

  await db.open();

  final app = unpub.App(
    metaStore: unpub.MongoStore(db),
    packageStore: unpub.FileStore(basedir),
  );

  var server = await app.serve('0.0.0.0', 8080);
  print('Serving at http://${server.address.host}:${server.port}');
}
