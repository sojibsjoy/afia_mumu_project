import 'package:flutter/material.dart';
import 'package:sample_app8/pages/gallery_screen.dart';
import 'package:sample_app8/pages/home_screen.dart';
import 'package:sample_app8/pages/view_recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (cotext) => const HomeScreen(),
        ViewRecipe.routeName: (context) => ViewRecipe(),
        GalleryScreen.routeName: (context) => GalleryScreen(),
      },
      initialRoute: HomeScreen.routeName,      
    );
  }
}
