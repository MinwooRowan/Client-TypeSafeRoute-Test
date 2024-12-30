import 'package:client_type_safe_route_test/common/data/model/user_model.dart';
import 'package:client_type_safe_route_test/common/domain/entity/user_entity.dart';
import 'package:client_type_safe_route_test/common/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserUseCase {
  UserUseCase(this._loginRepository);

  final UserRepository _loginRepository;

  Future<UserEntity> getUserInfo() async {
    final UserModel response = await _loginRepository.getUserInfo();
    return UserEntity.fromJson(response.toJson());
  }
}
