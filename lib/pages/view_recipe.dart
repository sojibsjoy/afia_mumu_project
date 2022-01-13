import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_app8/models/recipe_data.dart';
import 'package:sample_app8/models/recipe_model.dart';
import 'package:sample_app8/pages/gallery_screen.dart';

class ViewRecipe extends StatefulWidget {
  static const routeName = '/view_recipe';
  ViewRecipe({Key key}) : super(key: key);

  @override
  State<ViewRecipe> createState() => _ViewRecipeState();
}

class _ViewRecipeState extends State<ViewRecipe> {
  Future<String> _getDescription() async {
    final args = ModalRoute.of(context).settings.arguments;
    //return await rootBundle.loadString('assets/recipes/pizza.txt');
    if (args == 0) {
      return await rootBundle.loadString('assets/recipes/kacchi_b.txt');
    }
    if (args == 1) {
      return await rootBundle.loadString('assets/recipes/pizza.txt');
    }
    if (args == 2) {
      return await rootBundle.loadString('assets/recipes/chickenb.txt');
    }
    if (args == 3) {
      return await rootBundle.loadString('assets/recipes/roastd.txt');
    }
    if (args == 4) {
      return await rootBundle.loadString('assets/recipes/applep.txt');
    }
    if (args == 5) {
      return await rootBundle.loadString('assets/recipes/chocolatec.txt');
    }
    if (args == 6) {
      return await rootBundle.loadString('assets/recipes/borhani.txt');
    }
    if (args == 7) {
      return await rootBundle.loadString('assets/recipes/chickenm.txt');
    }
    if (args == 8) {
      return await rootBundle.loadString('assets/recipes/coffee.txt');
    }
    if (args == 9) {
      return await rootBundle.loadString('assets/recipes/donuts.txt');
    }
    if (args == 10) {
      return await rootBundle.loadString('assets/recipes/friedrice.txt');
    } else {
      return await rootBundle.loadString('assets/recipes/redvelvet.txt');
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    Recipe viewRecipeOb;
    if (args != null) {
      viewRecipeOb = recipeList[args as int];
    }
    return args == null
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Loading"),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(viewRecipeOb.title),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image.asset(
                        viewRecipeOb.imgPath,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      viewRecipeOb.title,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(viewRecipeOb.subTitle),
                    const SizedBox(height: 10),
                    FutureBuilder(
                      future: _getDescription(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox(
                            height: 180.0,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return Text(snapshot.data.toString());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      GalleryScreen.routeName,
                      arguments: args,
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
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    //  Navigator.pushNamed(
                    //   context,
                    //   GalleryScreen.routeName,
                    //    arguments: args,
                    //  );
                    print("Review");
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
                          Icons.list,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Review",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
