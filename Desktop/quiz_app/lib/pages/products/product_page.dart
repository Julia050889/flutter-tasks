import 'package:flutter/material.dart';
import 'package:quiz_app/api/indigo_api.dart';
import 'package:quiz_app/models/products/product_model.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quiz_app/pages/auth/login/login_styles.dart';
import 'package:quiz_app/widgets/detail_page.dart';

class ProductPageWidget extends StatefulWidget {
  const ProductPageWidget({super.key});

  @override
  State<ProductPageWidget> createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  bool changeView = true;
  double? _ratingValue;
  List<ProductModel> products = [];

  @override
  void initState() {
    getData().then(((value) {
      setState(() {
        if (value == null) {
          CircularProgressIndicator();
        }
        products = value;
      });
    }));
    super.initState();
  }

  Future getData() async {
    return await IndigoAPI().products.getProductsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  changeView = !changeView;
                });
              },
              icon: changeView
                  ? const Icon(Icons.list)
                  : const Icon(Icons.grid_view_outlined)),
          const SizedBox(
            width: 30,
          )
        ],
      ),
      body: resultView(),
    );
  }

  Widget resultView() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: changeView ? _buildGridView() : _buildListView(),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 2 / 3,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => detailPage(products[index])));
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
                          products[index].imageUrl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 30, left: 15, right: 15),
                        child: Column(
                          children: [
                            Text(
                              products[index].productName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              '${products[index].price}\$',
                              style: TextStyle(
                                  fontSize: 17,
                                  decoration: products[index].isAvailable
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

  Widget _buildListView() {
    return Scaffold(
        body: ListView.builder(
            itemCount: products.length,
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
                                    detailPage(products[index])));
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
                              products[index].imageUrl,
                              height: 150,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(products[index].productName,
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 10),
                                      RatingBar(
                                          initialRating: 3,
                                          itemSize: 20,
                                          direction: Axis.horizontal,
                                          //allowHalfRating: true,
                                          itemCount: 5,
                                          ratingWidget: RatingWidget(
                                              full: const Icon(Icons.star,
                                                  color: LoginStyles.mainColor),
                                              half: const Icon(
                                                Icons.star_half,
                                                color: LoginStyles.mainColor,
                                              ),
                                              empty: const Icon(
                                                Icons.star_outline,
                                                color: LoginStyles.mainColor,
                                              )),
                                          onRatingUpdate: (value) {
                                            setState(() {
                                              _ratingValue = value;
                                              //print(_ratingValue);
                                            });
                                          }),
                                      const SizedBox(height: 10),
                                      Text(
                                        '${products[index].price}\$',
                                        style: TextStyle(
                                            fontSize: 18,
                                            decoration: products[index]
                                                    .isAvailable
                                                ? TextDecoration.none
                                                : TextDecoration.lineThrough),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(products[index].materials.join(','))
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
                                          iconDisabledColor:
                                              const Color.fromARGB(
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
            }));
  }
}
