import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tajweed_app/cubit/favorite_cubit.dart';
import 'package:tajweed_app/utils/theme_app.dart';
import 'package:tajweed_app/views/home_page.dart';
import 'package:flutter_localization/flutter_localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FlutterLocalization localization = FlutterLocalization.instance;

    return BlocProvider(
      create: (context) => FavoritesCubit()..loadFavorites(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Tajweed",
        theme: buildAppTheme(),
        locale: const Locale('ar'), // Set Arabic as the default locale
        supportedLocales: const [
          Locale('ar'), // Arabic language
          Locale('en'), // English (you can add more if needed)
        ],
        localizationsDelegates: localization.localizationsDelegates,
        home: const MyHomePage(),
      ),
    );
  }
}
