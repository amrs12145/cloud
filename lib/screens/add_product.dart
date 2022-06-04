// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud/controller/controller.dart';
import 'package:cloud/models/product.dart';
import 'package:cloud/shared/constants.dart';
import 'package:cloud/shared/fields.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _img = TextEditingController();
  final TextEditingController _categories = TextEditingController();
  final TextEditingController _size = TextEditingController();
  final TextEditingController _color = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final Product _product = Product();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: Constants.padding,
        children: [
          InputField(
            controller: _title,
            hint: 'Title',
            prefixIcon: Icon(Icons.account_box),
          ),
          Constants.verticleSpacing,
          InputField(
            controller: _desc,
            hint: 'desc',
            prefixIcon: Icon(Icons.description),
          ),
          Constants.verticleSpacing,
          InputField(
            controller: _img,
            hint: 'img',
            prefixIcon: Icon(Icons.photo),
          ),
          Constants.verticleSpacing,
          InputField(
            controller: _categories,
            hint: 'categories',
            prefixIcon: Icon(Icons.category),
          ),
          Constants.verticleSpacing,
          InputField(
            controller: _color,
            hint: 'color',
            prefixIcon: Icon(Icons.colorize),
          ),
          Constants.verticleSpacing,
          InputField(
            type: TextInputType.number,
            controller: _size,
            hint: 'size',
            prefixIcon: Icon(Icons.photo_size_select_large_sharp),
          ),
          Constants.verticleSpacing,
          InputField(
            type: TextInputType.number,
            controller: _price,
            hint: 'price',
            prefixIcon: Icon(Icons.price_change),
          ),
          Constants.verticleSpacing,
          ElevatedButton(
            onPressed: () {
              _product.title = _title.text;
              _product.desc = _desc.text;
              _product.img = _img.text;
              _product.categories = [_categories.text];
              _product.size = int.tryParse(_size.text);
              _product.color = _color.text;
              _product.price = double.tryParse(_price.text);

              Controller.addProduct(_product);
              Navigator.of(context).pop(true);
            },
            child: Text('Add product'),
          ),
        ],
      ),
    );
  }
}
