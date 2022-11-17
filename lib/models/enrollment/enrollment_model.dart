// ignore_for_file: unused_element, non_constant_identifier_names

import 'package:backend/backend.dart';
import 'package:backend/models/courses/course_model.dart';
import 'package:backend/models/enrollment/feedback_model.dart';
import 'package:backend/models/enrollment/learning_model.dart';
import 'package:backend/models/user_model/student_model.dart';

class Enrollment extends ManagedObject<_Enrollment> implements _Enrollment {}

class _Enrollment {
  @Column(primaryKey: true)
  int? id;
  DateTime? time;
  bool? is_paid_subscription;
  @Relate(#enrollments)
  Student? student;

  @Relate(#enrollments)
  Course? course;

  ManagedSet<Feedback>? feeds;
  ManagedSet<LearningProgress>? learnings;
}
