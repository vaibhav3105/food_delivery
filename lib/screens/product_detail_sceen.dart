import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/info.dart';

import '../providers/cart_change_notifier_provider.dart';
import '../providers/meal_change_notifier_provider.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final String id;
  int price;
  ProductDetailScreen({Key? key, required this.id, required this.price})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  List<bool> toppingButtonStatus = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    ref.watch(cartNotifierProvider);
    ref.watch(MealNotifierProvider);
    final meal = ref.watch(MealNotifierProvider).findMyProductById(widget.id);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(MealNotifierProvider.notifier)
                            .toggleFavoriteStatus(widget.id);
                      },
                      icon: Icon(
                        !meal.isLiked ? Icons.favorite_outline : Icons.favorite,
                        color: Colors.red,
                        size: 40,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  meal.name,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  meal.description,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Rs.${widget.price.toString()}",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Container(
                    child: Image.network(
                      meal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    height: 270,
                    width: 270,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.purple,
                          radius: 5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Tomato",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.purple,
                          radius: 5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Cheese",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.purple,
                          radius: 5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Onion",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.purple,
                          radius: 5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Paneer",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Add Extra Topping",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    toppingButton(() {
                      setState(() {
                        toppingButtonStatus[0] = !toppingButtonStatus[0];
                      });

                      if (toppingButtonStatus[0]) {
                        widget.price = widget.price + 30;
                      } else {
                        widget.price = widget.price - 30;
                      }
                    }, "Tomato", toppingButtonStatus[0]),
                    toppingButton(() {
                      setState(() {
                        toppingButtonStatus[1] = !toppingButtonStatus[1];
                        if (toppingButtonStatus[1]) {
                          widget.price = widget.price + 40;
                        } else {
                          widget.price = widget.price - 40;
                        }
                      });
                    }, "Cheese", toppingButtonStatus[1]),
                    toppingButton(() {
                      setState(() {
                        toppingButtonStatus[2] = !toppingButtonStatus[2];
                        if (toppingButtonStatus[2]) {
                          widget.price = widget.price + 30;
                        } else {
                          widget.price = widget.price - 30;
                        }
                      });
                    }, "Onion", toppingButtonStatus[2]),
                    toppingButton(() {
                      setState(() {
                        toppingButtonStatus[3] = !toppingButtonStatus[3];
                        if (toppingButtonStatus[3]) {
                          widget.price = widget.price + 40;
                        } else {
                          widget.price = widget.price - 40;
                        }
                      });
                    }, "Paneer", toppingButtonStatus[3]),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        for (int i = 0; i < meal.rating; i++)
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 246, 174, 6),
                          ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${meal.rating.toString()}.0",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    FaIcon(
                      FontAwesomeIcons.clock,
                      color: Colors.green,
                      size: 17,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${meal.time.toString()}min",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      ref.read(cartNotifierProvider.notifier).addItem(
                          meal.id, meal.name, meal.imageUrl, widget.price);
                      // ref.read(MealNotifierProvider.notifier).getMeals();

                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.green,
                          content: Text(
                            "Added to Cart Successfully",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      width: 280,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 112, 4, 250),
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        "ADD TO CART",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
