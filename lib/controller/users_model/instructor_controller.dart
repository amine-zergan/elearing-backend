// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:backend/backend.dart';
import 'package:backend/models/user_model/instructor_model.dart';
import 'package:conduit_common/src/openapi/documentable.dart';
import 'package:conduit_open_api/v3.dart';

class InstructorController extends ResourceController {
  InstructorController({
    required this.context,
  });

  final ManagedContext context;
  @Operation.get()
  Future<Response> fetchallinstructor() async {
    final query = Query<Instructor>(context);
    final List<Instructor> instructors = await query.fetch();
    return Response.ok(instructors);
  }

  @Operation.get("id")
  Future<Response> fetchbyid(@Bind.path("id") int id) async {
    final query = Query<Instructor>(context)..where((x) => x.id).equalTo(id);
    final instructor = await query.fetchOne();
    if (instructor == null) {
      return Response.notFound(body: {"error": "insructor not found"});
    }
    return Response.ok(instructor);
  }

  @Operation.post()
  Future<Response> addinstructor(@Bind.body() Instructor instructor) async {
    if (instructor.first_name!.isEmpty) {
      return Response.badRequest(body: {"error": "instructor must has name"});
    }
    final query = Query<Instructor>(context)
      ..values.email = instructor.email
      ..values.first_name = instructor.first_name
      ..values.last_name = instructor.last_name
      ..values.registration = DateTime.now()
      ..values.qualification = instructor.qualification
      ..values.introduction = instructor.introduction
      ..values.num_of_reviws = instructor.num_of_reviws;
    final user = await query.insert();
    return Response.ok("user add with succes $user");
  }

  @override
  Map<String, APIResponse> documentOperationResponses(
      APIDocumentContext context, Operation operation) {
    return {"200": APIResponse("Successful response.")};
  }
}
