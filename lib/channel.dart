import 'package:backend/backend.dart';
import 'package:backend/configuration/application_config.dart';
import 'package:backend/controller/users_model/instructor_controller.dart';
import 'package:backend/controller/users_model/student_controller.dart';
import 'package:backend/models/user_model/user_model.dart';
import 'package:conduit/managed_auth.dart';

class BackendChannel extends ApplicationChannel {
  ManagedContext? context;
  AuthServer? authServer;

  static Future initializeApplication(ApplicationOptions options) async {}

  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final config =
        AppConfiguration.fromFile(File(options!.configurationFilePath!));
    final db = config.database;
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      db.username,
      db.password,
      db.host,
      db.port,
      db.databaseName,
    );
    context = ManagedContext(
      ManagedDataModel.fromCurrentMirrorSystem(),
      persistentStore,
    );
    final delegate = ManagedAuthDelegate<User>(context);
    authServer = AuthServer(delegate);
  }

  @override
  Controller get entryPoint {
    final router = Router()
      ..route("/auth/token").link(() => AuthController(authServer))
      ..route("/auth/code").link(() => AuthRedirectController(authServer!))
      ..route("/student").link(() => StudentController(context: context!))
      ..route("/instructor/[:id]")
          .link(() => InstructorController(context: context!));

    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    return router;
  }
}
