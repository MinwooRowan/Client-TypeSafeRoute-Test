import 'package:client_type_safe_route_test/common/data/model/user_model.dart';

abstract interface class UserRepository {
  Future<UserModel> getUserInfo();
}
