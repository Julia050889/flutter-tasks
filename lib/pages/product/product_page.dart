import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product/product_page_provider.dart';
import 'package:flutter_app/pages/product/product_page_widgets/card.dart';
import 'package:provider/provider.dart';

class ProductPageWidget extends StatelessWidget {
  const ProductPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
        create: (context) => ProductProvider(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Products',
            ),
            leading: const Icon(Icons.home),
            actions: const [Icon(Icons.grid_4x4_rounded)],
          ),
          body: Consumer<ProductProvider>(
            builder: (context, value, child) => value.isLoading
                ? const Center(child: CircularProgressIndicator.adaptive())
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemCount: value.data.length,
                        itemBuilder: (context, index) {
                          return cardBuild(value.data[index]);
                        }),
                  ),
          ),
        ));
  }
}
