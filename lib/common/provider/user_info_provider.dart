import 'package:client_type_safe_route_test/common/domain/entity/user_entity.dart';
import 'package:client_type_safe_route_test/common/domain/uss_case/user_use_case.dart';
import 'package:client_type_safe_route_test/di/get_it_configuration.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_info_provider.g.dart';

@riverpod
class UserInfo extends _$UserInfo {
  @override
  AsyncValue<UserEntity> build() {
    return AsyncValue.loading();
  }

  Future<void> getUserInfo() async {
    final UserUseCase loginUseCase = getIt<UserUseCase>();
    final UserEntity response = await loginUseCase.getUserInfo();
    state = AsyncValue.data(response);
  }
}
