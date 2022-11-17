// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:backend/backend.dart';
import 'package:backend/models/user_model/student_model.dart';

class StudentController extends ResourceController {
  ManagedContext context;
  StudentController({
    required this.context,
  });

  Future<Response> fetchstudent() async {
    final query = Query<Student>(context);
    final students = await query.fetch();
    return Response.ok("user fetched with succes $students");
  }
}
