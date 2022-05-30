import 'dart:convert';

import 'package:cloud/models/product.dart';
import 'package:cloud/models/user.dart';
import 'package:cloud/net/net.dart';
import 'package:cloud/shared/constants.dart';

class Controller {
  static void login(User user) async {
    final response = await Net.dio.post(
      Constants.loginPath,
      data: jsonEncode({user.toJson()}),
    );

    print(response.data);
  }

  static void register(User user) async {
    final response = await Net.dio.post(
      Constants.registerPath,
      data: jsonEncode(user.toJson()),
    );

    print(response.data);
  }

  static void addProduct(Product product) async {
    final response = await Net.dio.post(
      Constants.addProduct,
      data: product.toJson(),
    );

    print(response.data);
  }

  static void getProducts(Product product) async {
    final response = await Net.dio.get(
      Constants.getProducts,
      queryParameters: product.toJson(),
    );

    print(response.data);
  }
}
