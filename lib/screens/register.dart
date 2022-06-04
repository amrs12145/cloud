// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cloud/controller/controller.dart';
import 'package:cloud/models/user.dart';
import 'package:cloud/screens/login.dart';
import 'package:cloud/screens/products.dart';
import 'package:cloud/shared/constants.dart';
import 'package:cloud/shared/fields.dart';
import 'package:flutter/material.dart';

class Regisger extends StatelessWidget {
  final User user = User();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  Regisger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Constants.primary,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        padding: Constants.padding,
        children: [
          Constants.verticleSpacing,
          const Text(
            'Let\'s Get Started!',
            style: Constants.headlineStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Create an account to Q Allure to get all features',
            textAlign: TextAlign.center,
            style: Constants.textStyle,
          ),
          Constants.verticleSpacing,
          Constants.verticleSpacing,
          InputField(
            controller: _username,
            hint: 'Username',
            prefixIcon: const Icon(Icons.account_box_rounded),
          ),
          Constants.verticleSpacing,
          InputField(
            controller: _email,
            type: TextInputType.emailAddress,
            hint: 'Email',
            prefixIcon: const Icon(Icons.email),
          ),
          Constants.verticleSpacing,
          const InputField(
            type: TextInputType.number,
            hint: 'Phone',
            prefixIcon: Icon(Icons.phone_iphone),
          ),
          Constants.verticleSpacing,
          InputField(
            controller: _password,
            obscureText: true,
            hint: 'Password',
            prefixIcon: const Icon(Icons.lock_open),
          ),
          Constants.verticleSpacing,
          const InputField(
            obscureText: true,
            hint: 'Confirm Password',
            prefixIcon: Icon(Icons.lock_open),
          ),
          Constants.verticleSpacing,
          ElevatedButton(
            onPressed: () {
              user.username = _username.text;
              user.email = _email.text;
              user.password = _password.text;
              Controller.register(user);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProductList();
                  },
                ),
              );
            },
            child: const Text('CREATE'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Alread have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: const Text('Login here'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
