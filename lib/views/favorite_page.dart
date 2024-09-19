import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tajweed_app/cubit/favorite_cubit.dart';
import 'package:tajweed_app/model/tajweed.dart';
import 'package:tajweed_app/views/detail_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المفضلة'),
      ),
      body: BlocBuilder<FavoritesCubit, List<Tajweed>>(
        builder: (context, favorites) {
          if (favorites.isEmpty) {
            return const Center(
              child: Text('لم تقم بإضافة أي قواعد إلى المفضلة.'),
            );
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final ruleTitle = favorites[index];

              return ListTile(
                title: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RuleDetailPage(rule: ruleTitle),
                      ),
                    );
                  },
                  child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Text(ruleTitle.title)),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    context.read<FavoritesCubit>().removeFavorite(ruleTitle.id);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
