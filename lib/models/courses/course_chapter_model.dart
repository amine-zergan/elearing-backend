// ignore_for_file: non_constant_identifier_names

import 'package:backend/backend.dart';
import 'package:backend/models/courses/chapter_content_model.dart';
import 'package:backend/models/courses/course_model.dart';

class Chapter extends ManagedObject<_Chapter> implements _Chapter {}

class _Chapter {
  @Column(primaryKey: true)
  int? id;
  String? title;
  @Column(nullable: true)
  int? num_of_reading;
  @Column(nullable: true)
  int? num_of_video;
  @Column(nullable: true)
  int? num_of_assignment;

  @Relate(#chapters)
  Course? course;

  ManagedSet<ChapterContent>? chaptercontents;
}
