import 'package:flutter/material.dart';
import 'package:tajweed_app/model/tajweed.dart';
import 'package:tajweed_app/utils/fetch_data.dart';
import 'package:tajweed_app/views/detail_page.dart';
import 'package:tajweed_app/views/widgets/drawer.dart';

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
        body: FutureBuilder<List<Tajweed>>(
          future: futureRules,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: displayRules.length,
                itemBuilder: (context, index) {
                  final rule = displayRules[index];
                  return Card(
                    color: Theme.of(context).cardColor,
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 2.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RuleDetailPage(rule: rule),
                            ),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              rule.image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Text(
                                rule.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            IconButton(
                              alignment: Alignment.bottomRight,
                              icon: Icon(Icons.favorite_border,
                                  color: Theme.of(context).iconTheme.color),
                              onPressed: () {
                                // Handle favorite action here
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No data found.'));
            }
          },
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
