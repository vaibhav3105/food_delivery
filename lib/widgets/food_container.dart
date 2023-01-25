// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/info.dart';

import 'package:food_delivery/screens/product_detail_sceen.dart';

import '../providers/meal_change_notifier_provider.dart';

class FoodContainer extends ConsumerStatefulWidget {
  final String id;
  final String name;
  final String description;
  final int time;
  final int price;
  final int calories;
  final String imageUrl;
  bool isLiked;
  int rating;
  FoodContainer({
    Key? key,
    required this.id,
    required this.name,
    required this.description,
    required this.time,
    required this.price,
    required this.calories,
    required this.imageUrl,
    required this.isLiked,
    required this.rating,
  }) : super(key: key);

  @override
  ConsumerState<FoodContainer> createState() => _FoodContainerState();
}

class _FoodContainerState extends ConsumerState<FoodContainer> {
  @override
  Widget build(BuildContext context) {
    ref.watch(MealNotifierProvider);
    return GestureDetector(
      onTap: () {
        changeScreen(
            context,
            ProductDetailScreen(
              id: widget.id,
              price: widget.price,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.fire,
                    size: 18,
                    color: Color.fromARGB(255, 238, 83, 11),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "${widget.calories} Calories",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  IconButton(
                      onPressed: () {
                        ref
                            .read(MealNotifierProvider.notifier)
                            .toggleFavoriteStatus(widget.id);
                      },
                      icon: widget.isLiked
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: Colors.red,
                            ))
                ],
              ),
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.description,
                style: TextStyle(color: Colors.grey[700], fontSize: 13),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.clock,
                    color: Colors.green,
                    size: 17,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "${widget.time.toString()}min",
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    "Rs.${widget.price}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
