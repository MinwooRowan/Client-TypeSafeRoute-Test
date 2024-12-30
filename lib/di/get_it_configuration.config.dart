// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:client_type_safe_route_test/common/data/data_source/user_data_source.dart'
    as _i215;
import 'package:client_type_safe_route_test/common/data/repository/login_repository_impl.dart'
    as _i317;
import 'package:client_type_safe_route_test/common/domain/repository/user_repository.dart'
    as _i956;
import 'package:client_type_safe_route_test/common/domain/uss_case/user_use_case.dart'
    as _i914;
import 'package:client_type_safe_route_test/presentation/home/view_model/home_view_model.dart'
    as _i397;
import 'package:client_type_safe_route_test/presentation/login/view_model/login_view_model.dart'
    as _i906;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hooks_riverpod/hooks_riverpod.dart' as _i275;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i215.UserDataSource>(() => _i215.UserDataSource());
    gh.singleton<_i956.UserRepository>(
        () => _i317.UserRepositoryImpl(gh<_i215.UserDataSource>()));
    gh.singleton<_i914.UserUseCase>(
        () => _i914.UserUseCase(gh<_i956.UserRepository>()));
    gh.factory<_i397.HomeViewModel>(
        () => _i397.HomeViewModel(gh<_i914.UserUseCase>()));
    gh.factoryParam<_i906.LoginViewModel, _i275.Ref<Object?>, dynamic>((
      ref,
      _,
    ) =>
        _i906.LoginViewModel(
          gh<_i914.UserUseCase>(),
          ref,
        ));
    return this;
  }
}
