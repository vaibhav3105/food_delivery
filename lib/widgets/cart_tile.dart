// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cart_change_notifier_provider.dart';

class CartTile extends ConsumerStatefulWidget {
  final String id;
  final String name;

  final int price;
  final int quantity;
  final String mealId;
  final String imageUrl;

  const CartTile(
      {Key? key,
      required this.id,
      required this.name,
      required this.price,
      required this.quantity,
      required this.imageUrl,
      required this.mealId})
      : super(key: key);

  @override
  _CartTileState createState() => _CartTileState();
}

class _CartTileState extends ConsumerState<CartTile> {
  @override
  Widget build(BuildContext context) {
    ref.watch(cartNotifierProvider);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 5),
      child: Container(
        height: 100,
        width: 350,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              height: 180,
              width: 80,
              child: Image.network(
                widget.imageUrl,
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
                  widget.name,
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
                  children: [
                    Text(
                      "Rs.${widget.price.toString()}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 249, 71, 71),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              widget.quantity > 0
                                  ? ref
                                      .read(cartNotifierProvider.notifier)
                                      .decreaseQuantity(widget.mealId)
                                  : () {};
                            },
                            child: Text(
                              "-",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            widget.quantity.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(cartNotifierProvider.notifier)
                                  .increaseQuantity(widget.mealId);
                            },
                            child: Text(
                              "+",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
