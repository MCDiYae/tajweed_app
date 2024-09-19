import 'package:flutter/material.dart';

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
                const SizedBox(
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
            leading: const Icon(Icons.desktop_mac_outlined),
            title: const Text('معلومات حول التطبيق'),
            onTap: () {
              // Handle about navigation
            },
          ),
          Divider(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("المزيد"),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('سياسة الخصوصية'),
            onTap: () {
              // Handle settings navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('شارك التطبيق'),
            onTap: () {
              // Handle about navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('قيم التطبيق'),
            onTap: () {
              // Handle about navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag_rounded),
            title: const Text('المزيد من التطبيقات'),
            onTap: () {
              // Handle about navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.close),
            title: const Text('الخروج'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          // Add more ListTiles for other drawer items
        ],
      ),
    );
  }
}
