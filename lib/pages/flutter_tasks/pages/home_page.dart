import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/models/product_class.dart';
import 'dart:async' show Future;
import '../models/product_class.dart';
import 'package:flutter/services.dart' show rootBundle;
//import '../assets/products.json';
//import '../models/product_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];

  Future loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/people.json');
    final data = jsonDecode(jsonText);
    if (data is List) {
      return products = data
          .map<Product>(
            (p) => Product.fromJson(p),
          )
          .toList();
    }
  }

  @override
  void initState() {
    loadJsonData();
    super.initState();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView from data'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.account_box),
                ),
                title: Text(products[index].isAvailable.toString()),
                subtitle: Text(products[index].price.toString()),
              ),
              ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.account_box),
                ),
                title: Text(products[index].isAvailable.toString()),
                subtitle: Text(products[index].price.toString()),
              ),
              ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.account_box),
                ),
                title: Text(products[index].isAvailable.toString()),
                subtitle: Text(products[index].price.toString()),
              ),
              ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.account_box),
                ),
                title: Text(products[index].isAvailable.toString()),
                subtitle: Text(products[index].price.toString()),
              ),
            ],
          );
        },
      ),
    );
  }
}
