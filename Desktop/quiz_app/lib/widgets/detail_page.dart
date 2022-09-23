 import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/bottom_bar.dart';

Widget detailPage(product) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          Container(
              margin: const EdgeInsets.all(15),
              height: 150,
              child: CarouselSlider(
                items: [
                  Image.network(product.imageUrl),
                  Image.network(product.imageUrl)
                ],
                options: CarouselOptions(),
              )),
          const Divider(),
          Text(
            product.productName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(product.description),
          const SizedBox(height: 180),
        ]),
      ),
      bottomNavigationBar: bottomBar(product),
    );
  }
