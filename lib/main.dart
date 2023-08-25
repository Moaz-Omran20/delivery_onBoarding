import 'package:flutter/material.dart';
import 'board_model.dart';
import 'delivery_boarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<BoardModel> pages = [
    BoardModel(
        "Browse & Order All Products at any time", "assets/images/1.svg"),
    BoardModel("Your package in our safe hands", "assets/images/2.svg"),
    BoardModel("Commited delivery in time", "assets/images/3.svg"),
    BoardModel("Fastest and safest delivery", "assets/images/4.svg"),
  ];

  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView.builder(
          controller: pageController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return DeliveryBoarding(pages[index], pages.length, index,
                currentIndex, pageController);
          },
          onPageChanged: (value) {
            currentIndex = value;
            setState(() {});
          },
        ),
      ),
    );
  }
}
