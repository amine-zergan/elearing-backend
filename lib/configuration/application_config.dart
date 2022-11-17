import 'package:backend/backend.dart';

class AppConfiguration extends Configuration {
  AppConfiguration.fromFile(File file) : super.fromFile(file);

  late DatabaseConfiguration database;
}
