import 'package:client_type_safe_route_test/common/data/data_source/user_data_source.dart';
import 'package:client_type_safe_route_test/common/data/model/user_model.dart';
import 'package:client_type_safe_route_test/common/domain/repository/user_repository.dart';
import 'package:client_type_safe_route_test/util/logger.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userDataSource);

  final UserDataSource _userDataSource;

  UserModel? _cachedUserModel;

  /// 유저 정보를 가져오는 함수
  /// 캐시가 존재하면 캐시를 반환하고, 캐시가 존재하지 않으면 네트워크 요청을 진행합니다.
  @override
  Future<UserModel> getUserInfo() async {
    if (_cachedUserModel != null) {
      logger.d('캐시 유저 정보가 존재합니다. : $_cachedUserModel');
      return _cachedUserModel!;
    }

    logger.d('캐시 유저 정보가 존재하지 않습니다. 네트워크 요청을 진행합니다.');
    final Map<String, dynamic> response = await _userDataSource.getUserInfo();
    logger.d('네트워크 요청 결과 : $response');
    _cachedUserModel = UserModel.fromJson(response);
    return _cachedUserModel!;
  }

  /// 캐시를 제거해야 하는 경우 ex) 로그아웃
  /// [dispose]를 호출하여 캐시를 제거합니다.
  void dispose() {
    _cachedUserModel = null;
  }
}
