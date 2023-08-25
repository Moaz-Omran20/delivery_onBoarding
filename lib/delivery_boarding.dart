import 'package:delivery_onboard/board_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveryBoarding extends StatefulWidget {
  BoardModel pages;
  int length;
  int index;
  int currentIndex;
  PageController pageController;

  DeliveryBoarding(this.pages, this.length, this.index, this.currentIndex,
      this.pageController);

  @override
  State<DeliveryBoarding> createState() => _DeliveryBoardingState();
}

class _DeliveryBoardingState extends State<DeliveryBoarding> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Spacer(),
          Text(
            widget.pages.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SvgPicture.asset(widget.pages.image),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List<Widget>.generate(
              widget.length,
              (index) => Container(
                margin: const EdgeInsets.only(right: 5),
                height: 10,
                width: widget.currentIndex == index ? 20 : 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:widget.currentIndex==index? Colors.orange:Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.pageController.nextPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.bounceIn);
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Next",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
