import 'package:flutter/material.dart';

Widget bottomBar(productItem) {
  return Container(
    decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(
                width: 1, color: Color.fromARGB(255, 210, 208, 208)))),
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Total \nAmount',
            style: TextStyle(fontSize: 14, color: Colors.grey)),
        Text(
          '${productItem.price}\$',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        ElevatedButton(
            onPressed: () {},
            child: Text(
              'Remove Card'.toUpperCase(),
              style: const TextStyle(fontSize: 16),
            )),
      ],
    ),
  );
}
