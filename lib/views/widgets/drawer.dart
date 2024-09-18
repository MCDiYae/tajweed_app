import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/icon3.jpg",
                    // fit: BoxFit.none,
                    // height: 60,
                    // width: 60,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                const Text(
                  'قواعد تجويد\nالقران الكريم',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('المفضلة'),
            onTap: () {
              // Handle favorite navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('الإعدادات'),
            onTap: () {
              // Handle settings navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('معلومات حول التطبيق'),
            onTap: () {
              // Handle about navigation
            },
          ),
          // Add more ListTiles for other drawer items
        ],
      ),
    );
  }
}
