// ignore_for_file: non_constant_identifier_names

import 'package:backend/backend.dart';
import 'package:backend/models/enrollment/enrollment_model.dart';

class Feedback extends ManagedObject<_Feedback> implements _Feedback {}

class _Feedback {
  @Column(primaryKey: true)
  int? id;
  double? rating_score;
  @Column(nullable: true)
  String? feedback;
  DateTime? submission_date;

  @Relate(#feeds)
  Enrollment? enrollment;
}
