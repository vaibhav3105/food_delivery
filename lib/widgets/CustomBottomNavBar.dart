import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/providers/cart_change_notifier_provider.dart';
import 'package:food_delivery/providers/meal_change_notifier_provider.dart';
import 'package:food_delivery/screens/cart_screen.dart';
import 'package:food_delivery/screens/homepage.dart';
import 'package:food_delivery/screens/liked_screen.dart';

class CustomBottomNavbar extends ConsumerStatefulWidget {
  const CustomBottomNavbar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavbarState createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends ConsumerState<CustomBottomNavbar> {
  int curIndex = 0;
  static const List<Widget> _screens = [
    HomePage(),
    CartScreen(),
    LikedScreen()
  ];
  @override
  Widget build(BuildContext context) {
    ref.watch(cartNotifierProvider);
    return Scaffold(
      body: _screens.elementAt(curIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: curIndex,
        onTap: (index) {
          setState(() {
            curIndex = index;
          });
        },
        unselectedItemColor: Colors.grey[700],
        selectedItemColor: Color.fromARGB(255, 112, 4, 250),
        elevation: 0,
        iconSize: 22,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label:
                  "Cart ${ref.read(cartNotifierProvider).cartItems.length.toString()}"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
              ),
              label: "Liked"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: "Settings"),
        ],
      ),
    );
  }
}
