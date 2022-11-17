import 'package:backend/backend.dart';
import 'package:backend/models/courses/course_model.dart';

class Language extends ManagedObject<_Language> implements _Language {}

class _Language {
  @Column(primaryKey: true)
  int? id;
  String? name;

  ManagedSet<Course>? courses;
}
