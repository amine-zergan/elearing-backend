import 'package:backend/backend.dart';
import 'package:conduit_open_api/src/v3/request_body.dart';
import 'package:conduit_open_api/src/v3/path.dart';
import 'package:conduit_open_api/src/v3/parameter.dart';
import 'package:conduit_open_api/src/v3/operation.dart';
import 'package:conduit_common/src/openapi/documentable.dart';

class DocomentApi extends ResourceControllerDocumenter {
  @override
  void documentComponents(ResourceController rc, APIDocumentContext context) {}

  @override
  List<APIParameter?> documentOperationParameters(
      ResourceController rc, APIDocumentContext context, Operation? operation) {
    return [];
  }

  @override
  APIRequestBody? documentOperationRequestBody(
      ResourceController rc, APIDocumentContext context, Operation? operation) {
    throw UnimplementedError();
  }

  @override
  Map<String, APIOperation> documentOperations(ResourceController rc,
      APIDocumentContext context, String route, APIPath path) {
    throw UnimplementedError();
  }
}
