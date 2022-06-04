// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:cloud/models/product.dart';
import 'package:cloud/models/user.dart';
import 'package:cloud/net/net.dart';
import 'package:cloud/screens/products.dart';
import 'package:cloud/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Controller {
  static void login(User user, BuildContext context) async {
    final response = await Net.dio.post(
      Constants.registerPath,
      data: user.toJson(),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ProductList();
        },
      ),
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

  static void addProduct(Product product) async {
    final response = await Net.dio.post(
      Constants.addProduct,
      data: product.toJson(),
    );

    print(response.data);
  }

  static Future<List<Product>> getProducts() async {
    final response = await Net.dio.get(
      Constants.getProducts,
      // queryParameters: product.toJson(),
    );

    print(response.data);

    return (response.data as List).map((e) => Product.fromJson(e)).toList();
  }
}
