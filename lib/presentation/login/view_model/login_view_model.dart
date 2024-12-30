import 'package:client_type_safe_route_test/common/domain/entity/user_entity.dart';
import 'package:client_type_safe_route_test/common/domain/uss_case/user_use_case.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends ChangeNotifier {
  LoginViewModel(this._loginUseCase);
  final UserUseCase _loginUseCase;

  /// Riverpod에서 지원하는 [AsyncValue]타입을 그대로 사용했습니다.
  /// [hasValue], [hasError], [isLoading] 등의 상태를 가지고 있어서 UI에서
  /// 비동기 상태를 관리하기 편리합니다.
  ///
  /// Riverpod Provider를 사용하지 않더라도
  /// AsyncValue를 사용하는 것이 좋다고 생각합니다.
  AsyncValue<UserEntity> _userEntity = AsyncValue.loading();
  AsyncValue<UserEntity> get userEntity => _userEntity;

  Future<void> getUserInfo() async {
    final UserEntity response = await _loginUseCase.getUserInfo();
    _userEntity = AsyncValue.data(response);
    notifyListeners();
  }
}
