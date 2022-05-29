import 'package:cloud/models/user.dart';
import 'package:cloud/net/net.dart';
import 'package:cloud/shared/constants.dart';

class Controller {
  static void login(User user) async {
    final response = await Net.dio.post(
      Constants.loginPath,
      data: user.toJson(),
    );

    print(response.data);
  }

  static void register(User user) async {
    final response = await Net.dio.post(
      Constants.registerPath,
      data: user.toJson(),
    );

    print(response.data);
  }
}
