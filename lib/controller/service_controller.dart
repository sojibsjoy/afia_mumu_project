import 'package:get/get.dart';
import 'package:sample_app8/models/online_recipe_model.dart';
import 'package:sample_app8/services/service.dart';

class RecipeController extends GetxController {
  var isLoading = true.obs;
  RecipeModel obj;

  @override
  void onInit() {
    getRecipes();
    super.onInit();
  }

  void getRecipes() async {
    isLoading(true);
    try {
      var response = await BaseClient().get(
          "https://yummly2.p.rapidapi.com/feeds/list?limit=18&start=0&tag=list.recipe.popular",
          "", {
        "x-rapidapi-host": "yummly2.p.rapidapi.com",
        "x-rapidapi-key": "af65acfd73msh6ea794f026b179fp109688jsn7ac21ff9f92d",
      });
      obj = recipeModelFromJson(response.toString());
    } finally {
      isLoading(false);
    }
  }
}
