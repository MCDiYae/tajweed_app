// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tajweed_app/model/tajweed.dart';
import 'dart:convert';

part 'favorite_state.dart';

class FavoritesCubit extends Cubit<List<Tajweed>> {
  FavoritesCubit() : super([]);

  // Initialize favorites from SharedPreferences
  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String? favoritesJson = prefs.getString('favorites');
    if (favoritesJson != null) {
      final List<dynamic> favoritesList = json.decode(favoritesJson);
      emit(favoritesList.map((json) => Tajweed.fromJson(json)).toList());
    }
  }

  // Add a recipe to the favorites list
  void addFavorite(Tajweed rule) async {
    final currentFavorites = List<Tajweed>.from(state);
    if (!currentFavorites.any((r) => r.id == rule.id)) {
      currentFavorites.add(rule);
      emit(currentFavorites);
      _saveFavorites(currentFavorites);
    }
  }

  // Remove a recipe from the favorites list
  void removeFavorite(int ruleId) async {
    final currentFavorites = List<Tajweed>.from(state);
    currentFavorites.removeWhere((rule) => rule.id == ruleId);
    emit(currentFavorites);
    _saveFavorites(currentFavorites);
  }

  void _saveFavorites(List<Tajweed> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    final String favoritesJson =
        json.encode(favorites.map((rule) => rule.toJson()).toList());
    prefs.setString('favorites', favoritesJson);
  }
}
