import 'package:client_type_safe_route_test/common/domain/entity/user_entity.dart';
import 'package:client_type_safe_route_test/common/domain/uss_case/user_use_case.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel {
  LoginViewModel(
    this._loginUseCase,
    @factoryParam this.ref,
  );
  final Ref ref;
  final UserUseCase _loginUseCase;

  final ValueNotifier<AsyncValue<UserEntity>> _userInfoState = ValueNotifier(AsyncValue.loading());
  ValueNotifier<AsyncValue<UserEntity>> get userInfoState => _userInfoState;

  Future<void> getUserInfo() async {
    final UserEntity response = await _loginUseCase.getUserInfo();
    _userInfoState.value = AsyncValue.data(response);
  }
}
