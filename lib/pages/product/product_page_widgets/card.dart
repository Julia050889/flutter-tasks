import 'package:flutter/material.dart';

Widget cardBuild(product) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Expanded(
            child: Image.network(
          product.thumbnail,
          fit: BoxFit.cover,
          //width: double.infinity,
        )),
        SizedBox(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                product.title,
                textAlign: TextAlign.center,
              ),
              Text(
                product.description,
                overflow: TextOverflow.ellipsis,
              ),
              Text(product.price.toString()),
            ],
          ),
        )
      ]),
    ),
  );
}
