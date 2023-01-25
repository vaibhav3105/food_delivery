import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/models/meal_model.dart';

import 'package:food_delivery/widgets/favorite_tile.dart';

import '../providers/meal_change_notifier_provider.dart';

class LikedScreen extends ConsumerStatefulWidget {
  const LikedScreen({Key? key}) : super(key: key);

  @override
  _LikedScreenState createState() => _LikedScreenState();
}

class _LikedScreenState extends ConsumerState<LikedScreen> {
  List<MealModel> favorite_meals = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favorite_meals = ref.read(MealNotifierProvider).favoriteMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "My Favorites",
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: favorite_meals.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: FavoriteTile(
                      id: favorite_meals[index].id,
                      name: favorite_meals[index].name,
                      price: favorite_meals[index].price,
                      imageUrl: favorite_meals[index].imageUrl),
                );
              },
            ))
          ],
        ),
      )),
    );
  }
}
