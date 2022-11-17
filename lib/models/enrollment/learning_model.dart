import 'package:backend/backend.dart';
import 'package:backend/models/courses/chapter_content_model.dart';
import 'package:backend/models/enrollment/enrollment_model.dart';

class LearningProgress extends ManagedObject<_LearningProgess>
    implements _LearningProgess {}

class _LearningProgess {
  int? id;
  DateTime? started;
  DateTime? completed;

  @Relate(#learnings)
  Enrollment? enrollment;

  @Relate(#learnings)
  ChapterContent? content;
}
