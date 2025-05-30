import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/recipe_detail_screen.dart';
import 'screens/cooking_mode_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(SpoonieApp());
}

class SpoonieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spoonie Cooking App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/recipeDetail': (context) => RecipeDetailScreen(),
        '/cookingMode': (context) => CookingModeScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
