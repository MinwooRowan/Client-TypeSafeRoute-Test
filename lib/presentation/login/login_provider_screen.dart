import 'package:client_type_safe_route_test/common/provider/user_info_provider.dart';
import 'package:client_type_safe_route_test/router/router_builder.dart';
import 'package:client_type_safe_route_test/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Provider 사용 경우
class LoginProviderScreen extends HookConsumerWidget {
  const LoginProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Header(),
              Column(
                children: [
                  TextButton(
                    onPressed: () async => await ref.read(userInfoProvider.notifier).getUserInfo(),
                    child: Text('GET USERINFO'),
                  ),
                  SizedBox(height: 20),
                  userInfo.when(
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
              SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    logger.d('Header build');
    return Text('Login Provider Screen');
  }
}
