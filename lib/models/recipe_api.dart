import 'dart:convert';
import 'package:food_recipie/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
      "yummly2.p.rapidapi.com",
      "/feeds/list",
      {"limit": "24", "start": "0"},
    );

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "X-RapidAPI-Key": "865b551d48msh1f0e39c31e0c5dap14d49fjsn09b433be9641",
      "useQueryString": "true",
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapShot(_temp);
  }
}
