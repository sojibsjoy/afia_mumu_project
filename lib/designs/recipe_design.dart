import 'package:flutter/material.dart';

class RecipeCon extends StatefulWidget {
  final String imgPath;
  final String recipeTitle;
  final String recipeSubTitle;
  final bool isFavorite;
  const RecipeCon({
    Key? key,
    required this.imgPath,
    required this.recipeTitle,
    required this.recipeSubTitle,
    required this.isFavorite,
  }) : super(key: key);

  @override
  State<RecipeCon> createState() => _RecipeConState();
}

class _RecipeConState extends State<RecipeCon> {
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
                  child: Image.asset(
                    widget.imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              widget.isFavorite
                  ? GestureDetector(
                      onTap: () {},
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
                      onTap: () {},
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
          Expanded(
            child: Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.recipeTitle,
                        style: const TextStyle(
                          fontSize: 24,
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
