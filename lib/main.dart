// ignore_for_file: prefer_const_constructors

import 'package:cloud/screens/login.dart';
import 'package:cloud/screens/products.dart';
import 'package:cloud/shared/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud projects',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
          ),
          Constants.verticleSpacing,
          ElevatedButton(
            onPressed: () {},
            child: Text('Register'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (contxet) {
                    return ProductList();
                  },
                ),
              );
            },
            child: Text('Sign as a vistior'),
            clipBehavior: Clip.hardEdge,
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Constants.verticleSpacing,
          Constants.verticleSpacing,
          Constants.verticleSpacing,
        ],
      ),
    );
  }
}
