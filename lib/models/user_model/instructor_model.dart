// ignore_for_file: non_constant_identifier_names

import 'package:backend/backend.dart';
import 'package:backend/models/courses/course_model.dart';

class Instructor extends ManagedObject<_Instructor> implements _Instructor {}

class _Instructor {
  @Column(primaryKey: true, autoincrement: true)
  int? id;
  String? first_name;
  String? last_name;
  @Column(unique: true)
  String? email;
  DateTime? registration;
  bool? qualification;
  String? introduction;
  @Column(nullable: true)
  String? image;
  @Column(nullable: true)
  int? num_of_published_course;
  @Column(nullable: true)
  int? num_of_enrolled_students;
  @Column(nullable: true)
  double? averge_review_rating;
  @Column(nullable: true)
  double? num_of_reviws;

  ManagedSet<Course>? courses;
}
