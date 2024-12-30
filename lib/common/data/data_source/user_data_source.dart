import 'package:injectable/injectable.dart';

@singleton
class UserDataSource {
  Future<Map<String, dynamic>> getUserInfo() async {
    await Future.delayed(Duration(seconds: 1));
    return Future.value({
      'id': 1,
      'name': 'Minwoo',
    });
  }
}
