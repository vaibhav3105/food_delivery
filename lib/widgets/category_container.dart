import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/info.dart';

import 'package:food_delivery/models/meal_model.dart';
import 'package:food_delivery/screens/see_all_screen.dart';

import 'package:food_delivery/widgets/food_container.dart';

import '../providers/meal_change_notifier_provider.dart';

class CategoryContainer extends ConsumerStatefulWidget {
  final String category;

  CategoryContainer({Key? key, required this.category}) : super(key: key);

  @override
  ConsumerState<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends ConsumerState<CategoryContainer> {
  List<MealModel> category_meals = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category_meals =
        ref.read(MealNotifierProvider).mealsInCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(MealNotifierProvider);
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular ${widget.category}",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  changeScreen(context, SeeAllScreen());
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                      color: Color.fromARGB(255, 112, 4, 250),
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: category_meals.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FoodContainer(
                  id: category_meals[index].id,
                  name: category_meals[index].name,
                  description: category_meals[index].description,
                  time: category_meals[index].time,
                  price: category_meals[index].price,
                  calories: category_meals[index].calories,
                  imageUrl: category_meals[index].imageUrl,
                  isLiked: category_meals[index].isLiked,
                  rating: category_meals[index].rating,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
