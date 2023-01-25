import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/providers/meal_change_notifier_provider.dart';

import 'package:food_delivery/widgets/category_container.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  // var _isInit = true;
  // var _isloading = false;
  // @override
  // void didChangeDependencies() async {
  //   // TODO: implement didChangeDependencies
  //   if (_isInit) {
  //     setState(() {
  //       _isloading = true;
  //     });

  //     // Provider.of<Products>(context).fetchAndSetProducts().then((value) {
  //     //   setState(() {
  //     //     _isloading = false;
  //     //   });
  //     // });
  //     await ref.read(MealNotifierProvider.notifier).getMeals();
  //     print("x");
  //     setState(() {
  //       _isloading = false;
  //     });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    ref.watch(MealNotifierProvider);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: FaIcon(FontAwesomeIcons.barsStaggered),
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Let's Find",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Something Delicious!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.green)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.green)),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.black,
                          ),
                        ),
                        hintStyle: TextStyle(fontSize: 13),
                        hintText: "Search Categories...."),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              width: 3.0,
                              color: Color.fromARGB(255, 112, 4, 250)),
                          insets: EdgeInsets.only(right: 53, left: 20)),
                      indicatorWeight: 3,
                      labelPadding: EdgeInsets.only(right: 40, bottom: 10),
                      isScrollable: true,
                      labelColor: Color.fromARGB(255, 112, 4, 250),
                      unselectedLabelColor: Colors.grey,
                      labelStyle:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      tabs: [
                        Text("Foods"),
                        Text("Drinks"),
                        Text("Snacks"),
                        Text("Main Course"),
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(20),
                  height: 385,
                  child: TabBarView(
                    children: [
                      CategoryContainer(category: "Foods"),
                      CategoryContainer(category: "Drinks"),
                      CategoryContainer(category: "Snacks"),
                      CategoryContainer(category: "Main-Course"),
                    ],
                  ),
                )
                // DefaultTabController(
                //   length: 4,
                //   child: TabBar(
                //     indicatorWeight: 3,
                //     indicatorSize: TabBarIndicatorSize.label,
                //     labelPadding:
                //         EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //     indicatorColor: Color.fromARGB(255, 112, 4, 250),
                //     isScrollable: true,
                //     labelColor: Color.fromARGB(255, 112, 4, 250),
                //     unselectedLabelColor: Colors.grey,
                //     labelStyle:
                //         TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                //     tabs: [
                //       Text("Foods"),
                //       Text("Drinks"),
                //       Text("Snacks"),
                //       Text("Main Course"),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
