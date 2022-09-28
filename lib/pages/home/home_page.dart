import 'package:flutter/material.dart';
import 'package:quiz_app/base/routes.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawerEnableOpenDragGesture: false,
      //key: _key,
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
              // _key.currentState!.openDrawer();
            },
            child: Icon(Icons.menu),
          );
        },
      ),
      appBar: AppBar(
        title: const Text(
          'Home',
        ),

        // automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.indigo,
              child: const DrawerHeader(
                child: Text(
                  'INDIGO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Products'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.productspage);
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.settingpage);
              },
            ),
            ListTile(
              title: Text(
                'Feedback',
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.feedback);
              },
            ),
            const Spacer(),
            ListTile(
              title: Text('Log Out'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
