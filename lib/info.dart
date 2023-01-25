import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/meal_model.dart';

List<MealModel> meals = [
  MealModel(
      category: "Foods",
      id: "1",
      name: "Hamburger",
      description: "Veg Cheesy Hamburger",
      time: 15,
      price: 75,
      calories: 78,
      isLiked: false,
      rating: 5,
      imageUrl:
          "https://mcdonalds.com.au/sites/mcdonalds.com.au/files/MCD_Category_Burgers_375x268.png"),
  MealModel(
      category: "Foods",
      id: "2",
      name: "Margherita Pizza",
      description: "Veg Cheesy Margherita Pizza",
      time: 40,
      price: 185,
      calories: 120,
      isLiked: false,
      rating: 5,
      imageUrl:
          "https://images.unsplash.com/photo-1613564834361-9436948817d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1043&q=80"),
  MealModel(
      category: "Foods",
      id: "3",
      name: "Onion Capsicum Pizza",
      description: "Veggies Overloaded Pizza",
      time: 40,
      price: 185,
      calories: 120,
      isLiked: false,
      rating: 5,
      imageUrl:
          "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1081&q=80"),
  MealModel(
      category: "Drinks",
      id: "4",
      name: "Lemon Shake",
      description: "Sizzling lemon juics",
      time: 10,
      price: 35,
      calories: 40,
      isLiked: false,
      rating: 4,
      imageUrl:
          "https://images.unsplash.com/photo-1546173159-315724a31696?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
  MealModel(
      category: "Drinks",
      id: "5",
      name: "Banana Shake",
      description: "Yummiest Banana Shake on the planet",
      time: 15,
      price: 55,
      calories: 70,
      isLiked: false,
      rating: 5,
      imageUrl:
          "https://media.istockphoto.com/id/1018364696/photo/banana-almond-smoothie-with-cinnamon-and-oat-flakes-and-coconut-milk-in-glass-jars.jpg?b=1&s=170667a&w=0&k=20&c=MZNlbn719ewvWlFR03Er7-3v038boWMJ_LvhBM__MvY="),
  MealModel(
      category: "Drinks",
      id: "6",
      name: "Cappucino Coffee",
      description: "100% Pure Coffee with Powder overloaded",
      time: 10,
      price: 75,
      calories: 50,
      isLiked: true,
      rating: 4,
      imageUrl:
          "https://images.unsplash.com/photo-1534778101976-62847782c213?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
  MealModel(
      category: "Snacks",
      id: "7",
      name: "Momos",
      description: "Paneer Momos feel like no less than heaven",
      time: 30,
      price: 45,
      calories: 30,
      isLiked: true,
      rating: 5,
      imageUrl:
          "https://media.istockphoto.com/id/1133151212/photo/japanese-dumplings-gyoza-with-pork-meat-and-vegetables.jpg?b=1&s=170667a&w=0&k=20&c=amLjBj6Z85H5uhUt9pFNtSwiI23IpTCsYc_YCkL8puM="),
  MealModel(
      category: "Snacks",
      id: "8",
      name: "Chilly Paneer",
      description:
          "Chilly Panner with sticks and loads of crispiness and taste",
      time: 30,
      price: 45,
      calories: 30,
      isLiked: true,
      rating: 5,
      imageUrl:
          "https://spicecravings.com/wp-content/uploads/2022/01/Chilli-Paneer-Featured-2.jpg"),
  MealModel(
      category: "Snacks",
      id: "9",
      name: "French Fries",
      description: "Crispiest fries with dip",
      time: 20,
      price: 35,
      calories: 60,
      isLiked: true,
      rating: 5,
      imageUrl:
          "https://images.unsplash.com/photo-1608219994488-cc269412b3e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZnJpZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"),
  MealModel(
      category: "Main-Course",
      id: "10",
      name: "Dal Makhani",
      description: "Spicy Dal with loads of butter",
      time: 50,
      price: 195,
      calories: 160,
      isLiked: true,
      rating: 5,
      imageUrl:
          "https://i.ndtvimg.com/i/2016-11/dal-makhani_620x350_41478501912.jpg"),
  MealModel(
      category: "Main-Course",
      id: "11",
      name: "Kadhai Paneer",
      description: "Spicy Kadhai based Paneer",
      time: 50,
      price: 205,
      calories: 160,
      isLiked: true,
      rating: 5,
      imageUrl:
          "https://www.cookwithmanali.com/wp-content/uploads/2017/03/Best-Kadai-Paneer.jpg"),
  MealModel(
      category: "Main-Course",
      id: "12",
      name: "Aloo Pyaz Paratha",
      description: "Paratha with dal is a deadly combination.",
      time: 20,
      price: 75,
      calories: 110,
      isLiked: false,
      rating: 4,
      imageUrl:
          "https://lh3.googleusercontent.com/FCfWaQPQzqLzDw3ySUeFMts99s3etB4Siai2CEAETjam5SfSjVpEa9Hd7FHBxzK7UT7k45q2FkblX0pFNfgrJGGkDbQVkiBgwAuTbXM=w512-rw"),
];
void changeScreen(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}

void changeReplacementScreen(BuildContext context, Widget screen) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => screen));
}

Widget toppingButton(VoidCallback onPressed, String text, bool isSelected) {
  return !isSelected
      ? GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Text(text),
          ),
        )
      : GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
}

Map<String, CartModel> cart_items = {};
