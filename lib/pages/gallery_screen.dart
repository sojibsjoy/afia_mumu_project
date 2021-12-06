import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_app8/models/recipe_data.dart';
import 'package:sample_app8/models/recipe_model.dart';

class GalleryScreen extends StatefulWidget {
  static const routeName = '/gallery';
  //final int recipeNo;

  GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int? recipeNo;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    Recipe viewRecipeOb = recipeList[args as int];
    Future<String> _getDescription() async {
      return await rootBundle.loadString('assets/recipes/pizza.txt');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(viewRecipeOb.title),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.grey,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(5),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amberAccent,
                ),
                child: Center(child: Text("$index Rifat")),
              );
            },
            itemCount: 20,
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            GalleryScreen.routeName,
            arguments: recipeNo,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 75,
          width: 75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.image,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Gallery",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
