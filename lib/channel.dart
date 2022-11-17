// ignore_for_file: deprecated_member_use

import 'package:backend/backend.dart';
import 'package:backend/configuration/application_config.dart';
import 'package:backend/controller/users_model/instructor_controller.dart';
import 'package:backend/controller/users_model/student_controller.dart';
import 'package:backend/models/user_model/user_model.dart';
import 'package:conduit/managed_auth.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://conduit.io/docs/http/channel/.
class BackendChannel extends ApplicationChannel {
  ManagedContext? context;
  AuthServer? authServer;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
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

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router()
      ..route("/auth/token").link(() => AuthController(authServer))
      ..route("/auth/code").link(() => AuthRedirectController(authServer!))
      ..route("/student").link(() => StudentController(context: context!))
      ..route("/instructor/[:id]")
          .link(() => InstructorController(context: context!));

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://conduit.io/docs/http/request_controller/
    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    return router;
  }
}
