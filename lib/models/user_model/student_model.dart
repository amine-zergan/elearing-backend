// ignore_for_file: non_constant_identifier_names

import 'package:backend/backend.dart';
import 'package:backend/models/enrollment/enrollment_model.dart';

class Student extends ManagedObject<_Student> implements _Student {}

class _Student {
  @Column(primaryKey: true, autoincrement: true)
  int? id;
  String? first_name;
  String? last_name;
  @Column(unique: true)
  String? email;
  DateTime? registration;
  @Column(nullable: true)
  int? num_of_courses_enrolled;
  @Column(nullable: true)
  int? num_of_courses_complete;

  ManagedSet<Enrollment>? enrollments;
}
