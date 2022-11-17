// ignore_for_file: non_constant_identifier_names

import 'package:backend/backend.dart';
import 'package:backend/models/courses/content_type_model.dart';
import 'package:backend/models/courses/course_chapter_model.dart';
import 'package:backend/models/enrollment/learning_model.dart';

class ChapterContent extends ManagedObject<_ChapterContent>
    implements _ChapterContent {}

class _ChapterContent {
  @Column(primaryKey: true)
  int? id;
  @Column(defaultValue: "false")
  bool? is_mandatory;
  @Column(defaultValue: "false")
  bool? is_open;

  @Relate(#chaptercontents)
  Chapter? chapter;

  @Relate(#chaptercontents)
  Content? content;

  ManagedSet<LearningProgress>? learnings;
}
