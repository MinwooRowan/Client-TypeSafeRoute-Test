import 'package:client_type_safe_route_test/common/domain/entity/user_entity.dart';
import 'package:client_type_safe_route_test/common/domain/uss_case/user_use_case.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._userUseCase) {
    getUserInfo();
  }

  final UserUseCase _userUseCase;

  AsyncValue<UserEntity> _userEntity = AsyncValue.loading();
  AsyncValue<UserEntity> get userEntity => _userEntity;

  Future<void> getUserInfo() async {
    final UserEntity response = await _userUseCase.getUserInfo();
    _userEntity = AsyncValue.data(response);
    notifyListeners();
  }
}
