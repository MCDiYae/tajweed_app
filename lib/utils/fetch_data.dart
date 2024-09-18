import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:tajweed_app/model/tajweed.dart';

Future<List<Tajweed>> fetchRules() async {

  try {
    final String response =
        await rootBundle.loadString('assets/data/tajweed.json');
    final List<dynamic> data = json.decode(response);
    
    return data.map((json) => Tajweed.fromJson(json)).toList();
  } catch (e) {
    // ignore: avoid_print
    print("Error loading or parsing tajweed.json: $e");
      return [];
  }
}