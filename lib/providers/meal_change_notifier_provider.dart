import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/info.dart';

import '../models/meal_model.dart';

final MealNotifierProvider =
    ChangeNotifierProvider<MealItem>(((ref) => MealItem(meals)));

class MealItem with ChangeNotifier {
  final List<MealModel> _meals;
  MealItem(this._meals);
  List<MealModel> get meals {
    return [..._meals];
  }

  // getMeals() async {
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //       .collection("Kitchen")
  //       .doc("items")
  //       .get();
  //   List<MealModel> mealls = [];

  //   Map<String, dynamic> x = snapshot.data() as Map<String, dynamic>;

  //   for (var i = 0; i < x['Items'].length; i++) {
  //     mealls.add(MealModel.fromMap(x["Items"][i]));
  //   }
  //   Meals = mealls;
  //   print(Meals);
  //   notifyListeners();
  // }

  List<MealModel> mealsInCategory(String category) {
    List<MealModel> category_meals = [];
    for (MealModel meal in meals) {
      if (meal.category == category) {
        category_meals.add(meal);
      }
    }
    return category_meals;
  }

  MealModel findMyProductById(String id) {
    MealModel meal = _meals.firstWhere((element) => element.id == id);
    return meal;
  }

  void toggleFavoriteStatus(String mealId) {
    MealModel meal = _meals.firstWhere((element) => element.id == mealId);
    meal.isLiked = !meal.isLiked;
    notifyListeners();
  }

  List<MealModel> favoriteMeals() {
    List<MealModel> favorite_meals = [];
    for (MealModel meal in meals) {
      if (meal.isLiked == true) {
        favorite_meals.add(meal);
      }
    }
    return favorite_meals;
  }
}
