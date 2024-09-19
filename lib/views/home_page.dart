import 'package:flutter/material.dart';

import 'package:tajweed_app/model/tajweed.dart';
import 'package:tajweed_app/utils/fetch_data.dart';
import 'package:tajweed_app/views/widgets/drawer.dart';
import 'package:tajweed_app/views/widgets/list_rules.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Tajweed>> futureRules;
  List<Tajweed> allRules = [];
  List<Tajweed> displayRules = [];
  final TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  @override
  void initState() {
    super.initState();
    futureRules = fetchRules();
    futureRules.then((rules) {
      setState(() {
        allRules = rules;
        displayRules = rules;
      });
    });
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<Tajweed> dummyListData = [];
      for (var item in allRules) {
        if (item.title.contains(query)) {
          dummyListData.add(item);
        }
      }
      setState(() {
        displayRules = dummyListData;
      });
    } else {
      setState(() {
        displayRules = List.from(allRules);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: isSearching
              ? TextField(
                  controller: searchController,
                  onChanged: filterSearchResults,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        searchController.clear();
                        filterSearchResults('');
                        setState(() {
                          isSearching = false;
                        });
                      },
                    ),
                  ),
                )
              : const Text('قواعد تجويد القران الكريم'),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              icon: const Icon(Icons.search),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                  if (!isSearching) {
                    searchController.clear();
                    filterSearchResults('');
                  }
                });
              },
            ),
          ],
        ),
        // body: ListRules(futureRules: futureRules),
        body: ListRules(futureRules: futureRules),
        drawer: const MyDrawer(),
      ),
    );
  }
}
