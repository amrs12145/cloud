// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud/controller/controller.dart';
import 'package:cloud/models/product.dart';
import 'package:cloud/screens/add_product.dart';
import 'package:cloud/screens/product_details.dart';
import 'package:cloud/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Product List', style: Constants.textStyle),
      ),
      body: Column(
        children: [
          Padding(
            padding: Constants.padding,
            child: AppBar(
              backgroundColor: Colors.white,
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  '20 Products',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              actions: [
                Icon(Icons.sort_by_alpha_rounded, color: Constants.primary),
                Constants.horizontalSpacing,
                Icon(Icons.sort, color: Constants.primary),
                Constants.horizontalSpacing,
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: Controller.getProducts(),
                builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                  if (snapshot.connectionState != ConnectionState.done)
                    return CircularProgressIndicator();

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      if (index == 0) index++;
                      return Row(
                        children: [
                          Expanded(
                            child: buildProduct(
                                snapshot.data![index - 1], context),
                          ),
                          Expanded(
                            child: buildProduct(snapshot.data![index], context),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}

class Navbar extends StatefulWidget {
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _value,
      onTap: (value) {
        setState(() {
          _value = value;
        });
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: 'ADD',
          icon: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return AddProduct();
                  },
                ),
              );
            },
            child: Icon(Icons.production_quantity_limits),
          ),
        ),
      ],
    );
  }
}

Widget buildProduct(Product product, BuildContext context) {
  return Card(
    margin: Constants.padding,
    elevation: 20,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
    child: Column(
      children: [
        Image.network(
          product.img!,
        ),
        Constants.verticleSpacingS,
        Text(
          product.title!,
          style: TextStyle(fontSize: 19),
        ),
        Constants.verticleSpacingS,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product.price!.toString(),
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
            Constants.horizontalSpacing,
            Text(
              ((product.price! + 50).toString() + '\$'),
            ),
          ],
        ),
        Constants.verticleSpacingS,
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ProductDetails(
                    product: product,
                  );
                },
              ),
            );
          },
          child: Text('+ Show'),
          style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
          ),
        ),
        Constants.verticleSpacingS,
        Text('Standard delivery'),
        Constants.verticleSpacingS,
      ],
    ),
  );
}
