import 'package:client_type_safe_route_test/presentation/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useListenable(viewModel);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// LoginScreen에서 UserInfo를 이미 받아서 Repo에 캐시가 있기 떄문에
            /// 딜레이없이 바로 데이터를 불러올 수 있음
            viewModel.userEntity.when(
              data: (data) {
                return Text(data.toString());
              },
              error: (error, st) => Text(error.toString()),
              loading: () => CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
