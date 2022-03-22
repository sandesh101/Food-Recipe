import 'package:flutter/material.dart';
import 'package:food_recipie/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.restaurant_menu,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            const Text(
              'Food Menu',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: const RecipeCard(
          title: "My Recipe",
          rating: '3',
          cookTime: "20 Mins",
          thumbnailUrl:
              'https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
    );
  }
}
