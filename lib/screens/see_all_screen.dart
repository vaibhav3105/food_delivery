import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal_model.dart';
import '../providers/meal_change_notifier_provider.dart';
import '../widgets/favorite_tile.dart';

class SeeAllScreen extends ConsumerWidget {
  const SeeAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<MealModel> meals = ref.watch(MealNotifierProvider).meals;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Kitchen",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[400],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: FavoriteTile(
                      id: meals[index].id,
                      name: meals[index].name,
                      price: meals[index].price,
                      imageUrl: meals[index].imageUrl),
                );
              },
            ))
          ],
        ),
      )),
    );
  }
}
