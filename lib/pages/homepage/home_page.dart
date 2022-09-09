import 'package:flutter/material.dart';
import '../../api/indigo_api.dart';
import '../../base/route.dart';
import '../../models/product_model.dart';
import '../../pages/auth/login/login_styles.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
          ),
          backgroundColor: LoginStyles.mainColor,
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.settingpage);
              },
            )
          ],
          automaticallyImplyLeading: false,
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder(
      future: IndigoAPI().products.getProductsData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data as List<ProductModel>;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 25.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                          color: LoginStyles.mainColor.withOpacity(0.2),
                          width: 5)),
                  shadowColor: LoginStyles.mainColor,
                  // ignore: sort_child_properties_last
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25.0),
                    child: Column(children: [
                      Column(
                        children: [
                          Image(
                            image: NetworkImage(
                              imageList[index],
                            ),
                            height: 200,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  products[index].productName ?? '',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: LoginStyles.mainColor
                                          .withOpacity(0.9)),
                                ),
                                Text(
                                  products[index].price.toString() + '\$',
                                  style: TextStyle(
                                      fontSize: 22,
                                      decoration: products[index].isAvailable!
                                          ? TextDecoration.none
                                          : TextDecoration.lineThrough),
                                ),
                              ]
                              //style: TextStyle(fontSize: 16),
                              ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                products[index].materials!.join(' ,'),
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return DetailPage(
                                          index,
                                          products[index].productName!,
                                          imageList[index],
                                          products[index].price.toString(),
                                        );
                                      }),
                                    );
                                  },
                                  child: const Text(
                                    "View more details",
                                    style: const TextStyle(
                                        color: LoginStyles.mainColor),
                                  ))
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                  elevation: 20,
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text('No Items'),
          );
        }
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  int? index;
  String title;
  String image;
  String price;
  DetailPage(this.index, this.title, this.image, this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: LoginStyles.mainColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Center(child: Image.network(image)),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${price}\$',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  'Description: It is a long established fact that a reader will be distracted by the readable content of a , as opposed to using making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy.It is a long established fact that a reader will be distracted by the readable content of a , as opposed to using making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy.It is a long established fact that a reader will be distracted by the readable content of a , as opposed to using making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy.')
            ],
          ),
        ),
      ),
    );
  }
}
