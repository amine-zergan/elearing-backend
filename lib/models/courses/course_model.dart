// ignore: unused_element
// ignore_for_file: non_constant_identifier_names

import 'package:backend/backend.dart';
import 'package:backend/models/courses/course_chapter_model.dart';
import 'package:backend/models/courses/language_model.dart';
import 'package:backend/models/enrollment/enrollment_model.dart';
import 'package:backend/models/user_model/instructor_model.dart';

class Course extends ManagedObject<_Course> implements _Course {}

class _Course {
  @Column(primaryKey: true)
  int? id;
  String? course_title;
  String? course_brief;
  int? num_of_chapters;

  @Relate(#courses)
  Language? language;

  @Relate(#courses)
  Instructor? instructor;

  ManagedSet<Chapter>? chapters;

  ManagedSet<Enrollment>? enrollments;
}
