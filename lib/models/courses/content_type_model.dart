import 'package:backend/backend.dart';
import 'package:backend/models/courses/chapter_content_model.dart';

class Content extends ManagedObject<_Content> implements _Content {}

class _Content {
  @Column(primaryKey: true)
  int? id;
  String? type;

  ManagedSet<ChapterContent>? chaptercontents;
}
