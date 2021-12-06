import 'package:flutter/material.dart';
import 'package:sample_app8/designs/recipe_design.dart';
import 'package:sample_app8/models/recipe_data.dart';
import 'package:sample_app8/pages/login_screen.dart';
import 'package:sample_app8/pages/profile_screen.dart';
import 'package:sample_app8/pages/test_view.dart';
import 'package:sample_app8/pages/view_recipe.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(
            fontFamily: 'IndieFlower',
            fontSize: 28,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
          ),
          onPressed: () {
            // add some navigation
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TestView(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      backgroundColor: Colors.blue,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 0.0),
          child: ListView.builder(
            itemCount: recipeList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ViewRecipe.routeName,
                    arguments: index,
                  );
                },
                child: RecipeCon(
                  imgPath: recipeList[index].imgPath,
                  recipeTitle: recipeList[index].title,
                  recipeSubTitle: recipeList[index].subTitle,
                  isFavorite: recipeList[index].isFavorite,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
