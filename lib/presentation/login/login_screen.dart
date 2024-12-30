import 'package:client_type_safe_route_test/presentation/login/view_model/login_view_model.dart';
import 'package:client_type_safe_route_test/router/router_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({
    super.key,
    required this.viewModel,
  });

  final LoginViewModel viewModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useListenable(viewModel);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 버튼을 통해 UserInfo를 Viewmodel -> UseCase ->
            /// Repo(cache) -> DataSource에 요청하는 코드
            TextButton(
              onPressed: () async => await viewModel.getUserInfo(),
              child: Text('GET USERINFO'),
            ),
            SizedBox(height: 20),

            /// 데이터가 잘 불러와졌는지 확인용 위젯
            /// Riverpod AsyncValue타입 사용 : 설명은 login_view_model.dart에 있음
            viewModel.userEntity.when(
              data: (data) {
                return Text(data.toString());
              },
              error: (error, st) => Text(error.toString()),
              loading: () => CircularProgressIndicator(),
            ),
            SizedBox(height: 40),

            TextButton(
              onPressed: () => HomeRoute().go(context),
              child: Text('GO TO HOME'),
            ),
          ],
        ),
      ),
    );
  }
}
