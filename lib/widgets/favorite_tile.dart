// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/providers/cart_change_notifier_provider.dart';

import '../info.dart';
import '../screens/product_detail_sceen.dart';

class FavoriteTile extends ConsumerWidget {
  final String id;
  final String name;

  final int price;

  final String imageUrl;
  FavoriteTile({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartNotifierProvider);
    return GestureDetector(
      onTap: () {
        changeScreen(
            context,
            ProductDetailScreen(
              id: id,
              price: price,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15, top: 5),
        child: Container(
          height: 100,
          width: 400,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Container(
                height: 180,
                width: 80,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Rs.${price.toString()}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      InkWell(
                        onTap: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .addItem(id, name, imageUrl, price);
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
                          alignment: Alignment.center,
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 112, 4, 250),
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            "ADD TO CART",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
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
