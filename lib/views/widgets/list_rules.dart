import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tajweed_app/model/tajweed.dart';
import 'package:tajweed_app/views/detail_page.dart';

import '../../cubit/favorite_cubit.dart';

class ListRules extends StatelessWidget {
  const ListRules({
    super.key,
    required this.futureRules,
  });

  final Future<List<Tajweed>> futureRules;

  @override
  Widget build(BuildContext context) {
    // Access the FavoritesCubit in this widget
    final favoritesCubit = context.read<FavoritesCubit>();

    return FutureBuilder<List<Tajweed>>(
      future: futureRules,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final rules = snapshot.data!;
          return ListView.builder(
            itemCount: rules.length,
            itemBuilder: (context, index) {
              final rule = rules[index];

              return Card(
                color: Theme.of(context).cardColor,
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
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
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            rule.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox(width: 16),
                        BlocBuilder<FavoritesCubit, List<Tajweed>>(
                          builder: (context, state) {
                            final isFavorite = favoritesCubit.state
                                .any((fav) => fav.id == rule.id);
                            return IconButton(
                              color: Theme.of(context).dialogBackgroundColor,
                              alignment: Alignment.topLeft,
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                //color: isFavorite ? Colors.red : Colors.grey,
                              ),
                              onPressed: () {
                                // Toggle favorite
                                if (isFavorite) {
                                  favoritesCubit.removeFavorite(rule.id);
                                } else {
                                  favoritesCubit.addFavorite(rule);
                                }
                              },
                            );
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
    );
  }
}
