import 'package:flutter/material.dart';
import 'package:flutter_app/base/route.dart';
import 'package:flutter_app/pages/home/home_provider.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: ChangeNotifierProvider<HomePageProvider>(
        create: (context) => HomePageProvider(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text(
              'Our shop',
            ),

            titleSpacing: 0,
            // leading: IconButton(
            //   icon: Icon(Icons.menu),
            //   onPressed: () {},
            // ),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.access_alarm_sharp)),
              IconButton(
                onPressed: () {},
                icon: const CircleAvatar(
                    //foregroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                  'https://i1.kym-cdn.com/photos/images/facebook/000/084/707/santa.PNG',
                )),
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            // flexibleSpace: Container(
            //   decoration: const BoxDecoration(
            //       gradient: LinearGradient(
            //           colors: [Colors.purple, Colors.red],
            //           begin: Alignment.topLeft,
            //           end: Alignment.bottomRight)),
            // ),
            bottom: const TabBar(indicatorColor: Colors.amber,
                //labelColor: Colors.pink,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                    text: 'Home',
                  ),
                  Tab(
                    icon: Icon(Icons.settings),
                    text: 'Settings',
                  ),
                  Tab(
                    icon: Icon(Icons.photo),
                    text: 'Photo',
                  ),
                  Tab(
                    icon: Icon(Icons.person_off_outlined),
                    text: 'Profile',
                  ),
                ]),
          ),
          drawer: Drawer(
              child: ListView(
                children: [
                  buildDrawerHeader(),
                  Column(
                    children: [
                      buildDrawerItem(context,
                          title: 'Home', icon: Icon(Icons.home)),
                      buildDrawerItem(context,
                          title: 'Settings', icon: Icon(Icons.settings)),
                      buildDrawerItem(context,
                          title: 'profile',
                          icon: Icon(Icons.portable_wifi_off_outlined)),
                      buildDrawerItem(context,
                          title: 'Photo', icon: Icon(Icons.photo)),
                    ],
                  )
                ],
              ),
              elevation: 0,
              backgroundColor: Colors.purple),
          body: Consumer<HomePageProvider>(
            builder: (context, value, child) => value.pages[value.currentIndex],
          ),
          // Image.network(
          //   'https://i1.kym-cdn.com/photos/images/facebook/000/084/707/santa.PNG',
          //   width: double.infinity,
          //   height: double.infinity,
          //fit: BoxFit.contain,
          //),
          bottomNavigationBar: Consumer<HomePageProvider>(
            builder: (context, provider, child) => BottomNavigationBar(
                elevation: 0,
                currentIndex: provider.currentIndex,
                onTap: (value) => provider.onChangeIndex(value),
                backgroundColor: Colors.blue,
                selectedItemColor: Colors.pink,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.purple,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.portable_wifi_off), label: 'Profile'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.photo), label: 'Photo')
                ]),
          ),
        ),
      ),
    );
  }

  Widget buildDrawerHeader() {
    return DrawerHeader(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i1.kym-cdn.com/photos/images/facebook/000/084/707/santa.PNG'),
            radius: 52,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text('Mane Soghoyan'), Text('gfjgj@mail.ru')],
          ),
          Icon(Icons.abc),
        ],
      ),
    );
  }

  Widget buildDrawerItem(BuildContext context, {String? title, Widget? icon}) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productpage);
      },
      leading: icon!,
      title: Text(title!),
    );
  }
}
