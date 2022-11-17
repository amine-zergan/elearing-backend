import 'package:backend/backend.dart';
import 'package:conduit/managed_auth.dart';

class User extends ManagedObject<_User>
    implements _User, ManagedAuthResourceOwner<_User> {}

class _User extends ResourceOwnerTableDefinition {
  @Column(unique: true)
  String? email;
}
