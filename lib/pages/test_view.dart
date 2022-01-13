import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app8/controller/service_controller.dart';
import 'package:sample_app8/designs/recipe_design.dart';

class TestView extends StatefulWidget {
  const TestView({Key key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  final RecipeController recipeController = Get.put(RecipeController());
  int viewID = 0; // 0 means Description
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  "List of all the available recipes",
                ),
                Obx(() {
                  if (recipeController.isLoading.value) {
                    return CircularProgressIndicator();
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: recipeController.obj.feed.length,
                          itemBuilder: (BuildContext context, int index) {
                            return REcipeOnlineCon(
                              imgPath: recipeController
                                  .obj.feed[index].display.images.first,
                              isFavorite: false,
                              recipeTitle: recipeController
                                  .obj.feed[index].display.displayName,
                              recipeSubTitle:
                                  "Steps: ${recipeController.obj.feed[index].content.preparationStepCount}",
                            );
                          },
                        ),
                      ),
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class REcipeOnlineCon extends StatefulWidget {
  final String imgPath;
  final String recipeTitle;
  final String recipeSubTitle;
  final bool isFavorite;
  const REcipeOnlineCon({
    Key key,
    this.imgPath,
    this.recipeTitle,
    this.recipeSubTitle,
    this.isFavorite,
  }) : super(key: key);

  @override
  State<REcipeOnlineCon> createState() => _REcipeOnlineConState();
}

class _REcipeOnlineConState extends State<REcipeOnlineCon> {
  bool favoriteFlag;

  @override
  void initState() {
    favoriteFlag = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      height: 270.0,
      width: 335.0,
      decoration: const BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              SizedBox(
                height: 200.0,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    widget.imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              favoriteFlag
                  ? GestureDetector(
                      onTap: () => setState(() => favoriteFlag = false),
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: const CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 25.0,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () => setState(() => favoriteFlag = true),
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.7),
                          radius: 25.0,
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
          SizedBox(
            width: 380,
            child: Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                SizedBox(
                  height: 55,
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.recipeTitle,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'IndieFlower',
                          ),
                        ),
                        Text(
                          widget.recipeSubTitle,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
