import 'package:flutter/material.dart';
import 'package:food_recipie/models/recipe.dart';
import 'package:food_recipie/models/recipe_api.dart';
import 'package:food_recipie/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    // print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.restaurant_menu,
              color: Colors.black,
            ),
            SizedBox(width: 10),
            Text(
              'Food Menu',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                  title: _recipes[index].name,
                  rating: _recipes[index].rating.toString(),
                  cookTime: _recipes[index].totalTime,
                  thumbnailUrl: _recipes[index].images,
                );
              },
            ),
    );
  }
}
