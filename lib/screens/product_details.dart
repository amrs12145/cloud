// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud/controller/controller.dart';
import 'package:cloud/models/product.dart';
import 'package:cloud/provider/product.dart';
import 'package:cloud/shared/constants.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Image.network(product.img!),
            pinned: true,
            floating: true,
            expandedHeight: 200,
            backgroundColor: Colors.transparent,
          ),
          SliverFillRemaining(
            child: Container(
              color: Colors.grey.shade100,
              padding: Constants.padding,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(product.title!),
                          Row(
                            children: [
                              Text(
                                product.price!.toString(),
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Constants.primary!.withOpacity(0.8),
                                ),
                              ),
                              Constants.horizontalSpacing,
                              Text(
                                (product.price! + 50).toString(),
                                style: Constants.headlineStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      _button(),
                    ],
                  ),
                  Constants.verticleSpacing,
                  Text('Size', style: Constants.headlineStyle),
                  Constants.verticleSpacing,
                  Cups(product: product),
                  Constants.verticleSpacing,
                  Text('Sugar', style: Constants.headlineStyle),
                  Constants.verticleSpacing,
                  Sugars(product: product),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Controller.addProduct(product);
                      Navigator.of(context).pop(true);
                    },
                    child: Text('Add to Card'),
                    style: ElevatedButton.styleFrom(
                      primary: Constants.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: Constants.radius,
                      ),
                      fixedSize: Size(180, 50),
                    ),
                  ),
                  Constants.verticleSpacing,
                  Constants.verticleSpacing,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _button extends StatefulWidget {
  @override
  State<_button> createState() => _buttonState();
}

class _buttonState extends State<_button> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _count--;
            });
          },
          child: Text('-', style: TextStyle(fontSize: 18)),
          style: ElevatedButton.styleFrom(
            primary: Constants.primary,
            shape: RoundedRectangleBorder(
              borderRadius: Constants.radius,
            ),
          ),
        ),
        SizedBox(width: 4),
        Text(
          '$_count',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(width: 4),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _count++;
            });
          },
          child: Text('+', style: TextStyle(fontSize: 18)),
          style: ElevatedButton.styleFrom(
            primary: Constants.primary,
            shape: RoundedRectangleBorder(
              borderRadius: Constants.radius,
            ),
          ),
        ),
      ],
    );
  }
}

class Cups extends StatefulWidget {
  final Product product;

  const Cups({Key? key, required this.product}) : super(key: key);

  @override
  State<Cups> createState() => _CupsState();
}

class _CupsState extends State<Cups> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => setState(() => _selected = 0),
          child: Icon(
            Provider.icons[0],
            size: 30,
            color: _selected != 0
                ? Constants.primary!.withOpacity(0.5)
                : Constants.primary,
          ),
        ),
        Constants.horizontalSpacing,
        GestureDetector(
          onTap: () => setState(() => _selected = 1),
          child: Icon(
            Provider.icons[1],
            size: 35,
            color: _selected != 1
                ? Constants.primary!.withOpacity(0.5)
                : Constants.primary,
          ),
        ),
        Constants.horizontalSpacing,
        GestureDetector(
          onTap: () => setState(() => _selected = 2),
          child: Icon(
            Provider.icons[2],
            size: 40,
            color: _selected != 2
                ? Constants.primary!.withOpacity(0.5)
                : Constants.primary,
          ),
        ),
      ],
    );
  }
}

class Sugars extends StatefulWidget {
  final Product product;

  const Sugars({Key? key, required this.product}) : super(key: key);

  @override
  State<Sugars> createState() => _SugarsState();
}

class _SugarsState extends State<Sugars> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => setState(() => _selected = 0),
          child: Icon(
            Provider.icons[0],
            size: 30,
            color: _selected != 0
                ? Constants.primary!.withOpacity(0.5)
                : Constants.primary,
          ),
        ),
        Constants.horizontalSpacing,
        GestureDetector(
          onTap: () => setState(() => _selected = 1),
          child: Icon(
            Provider.icons[1],
            size: 35,
            color: _selected != 1
                ? Constants.primary!.withOpacity(0.5)
                : Constants.primary,
          ),
        ),
        Constants.horizontalSpacing,
        GestureDetector(
          onTap: () => setState(() => _selected = 2),
          child: Icon(
            Provider.icons[2],
            size: 40,
            color: _selected != 2
                ? Constants.primary!.withOpacity(0.5)
                : Constants.primary,
          ),
        ),
      ],
    );
  }
}
