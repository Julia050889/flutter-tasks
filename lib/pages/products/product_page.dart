import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:quiz_app/pages/auth/login/login_styles.dart';
import 'package:quiz_app/pages/products/product_provider.dart';
import 'package:quiz_app/widgets/detail_page.dart';

class ProductPageWidget extends StatelessWidget {
  const ProductPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductPageProvider>(
      create: (context) => ProductPageProvider(),
      child: Consumer<ProductPageProvider>(
        builder: (context, provider, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Products'),
            actions: [
              IconButton(
                  onPressed: () {
                    provider.onChangeIcon();
                  },
                  icon: provider.changeView
                      ? const Icon(Icons.list)
                      : const Icon(Icons.grid_view_outlined)),
            ],
          ),
          body: resultView(),
        ),
      ),
    );
  }

  Widget resultView() {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child:
            Consumer<ProductPageProvider>(builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return provider.changeView
                ? _buildGridView(provider)
                : _buildListView(provider);
          }
        }));
  }

  Widget _buildGridView(value) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 2 / 3,
        ),
        itemCount: value.products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            detailPage(value.products[index])));
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: LoginStyles.mainColor.withOpacity(0.2),
                          width: 5)),
                  shadowColor: LoginStyles.mainColor,
                  elevation: 8,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          value.products[index].imageUrl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 30, left: 15, right: 15),
                        child: Column(
                          children: [
                            Text(
                              value.products[index].productName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              '${value.products[index].price}\$',
                              style: TextStyle(
                                  fontSize: 17,
                                  decoration: value.products[index].isAvailable
                                      ? TextDecoration.none
                                      : TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )));
        });
  }

  Widget _buildListView(value) {
    return Scaffold(
      body: ListView.builder(
          itemCount: value.products.length,
          itemBuilder: (context, index) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  detailPage(value.products[index])));
                    },
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: LoginStyles.mainColor.withOpacity(0.5),
                            offset: const Offset(3, 5),
                            blurRadius: 30)
                      ]),
                      child: Row(
                        children: [
                          Image.network(
                            value.products[index].imageUrl,
                            height: 150,
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(value.products[index].productName,
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 10),
                                    const SizedBox(height: 10),
                                    Text(
                                      '${value.products[index].price}\$',
                                      style: TextStyle(
                                          fontSize: 18,
                                          decoration:
                                              value.products[index].isAvailable
                                                  ? TextDecoration.none
                                                  : TextDecoration.lineThrough),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(value.products[index].materials
                                        .join(','))
                                  ],
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: FavoriteButton(
                                        iconColor: LoginStyles.mainColor,
                                        iconSize: 50,
                                        iconDisabledColor: const Color.fromARGB(
                                            255, 197, 194, 194),
                                        isFavorite: false,
                                        valueChanged: (isFavorite) {
                                          // print('Is Favorite : $isFavorite');
                                        },
                                      )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ]);
          }),
    );
  }
}
