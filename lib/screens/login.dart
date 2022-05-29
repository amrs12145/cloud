// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud/controller/register_controller.dart';
import 'package:cloud/models/user.dart';
import 'package:cloud/screens/register.dart';
import 'package:cloud/shared/constants.dart';
import 'package:cloud/shared/fields.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final User user = User();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: Constants.padding,
        children: [
          FlutterLogo(
            size: 100,
          ),
          Constants.verticleSpacing,
          Text(
            'Welcome back!',
            style: Constants.headlineStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Login to your existant account of Q Allure',
            textAlign: TextAlign.center,
            style: Constants.textStyle,
          ),
          Constants.verticleSpacing,
          Constants.verticleSpacing,
          InputField(
            controller: _username,
            hint: 'Username',
            prefixIcon: Icon(Icons.account_box_rounded),
          ),
          Constants.verticleSpacing,
          Constants.verticleSpacing,
          InputField(
            controller: _password,
            obscureText: true,
            hint: 'Password',
            prefixIcon: Icon(Icons.lock_open),
          ),
          Constants.verticleSpacing,
          ElevatedButton(
            onPressed: () {
              user.username = _username.text;
              user.password = _password.text;
              Controller.login(user);
            },
            child: Text('LOGIN'),
          ),
          Constants.verticleSpacing,
          Text(
            'Foget password',
            textAlign: TextAlign.end,
            style: Constants.textStyle,
          ),
          Constants.verticleSpacing,
          Constants.verticleSpacing,
          Text(
            'Or connect using',
            textAlign: TextAlign.center,
            style: Constants.textStyle,
          ),
          Constants.verticleSpacing,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                child: Row(
                  children: [
                    Icon(Icons.facebook),
                    Text('  Facebook'),
                  ],
                ),
              ),
              Constants.horizontalSpacing,
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Row(
                  children: [
                    Text(
                      'G  ',
                      style: Constants.headlineStyle,
                    ),
                    Text('Google'),
                  ],
                ),
              ),
            ],
          ),
          Constants.verticleSpacing,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Regisger(),
                    ),
                  );
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
