import 'package:animated_list_view/Animated%20Scroll%20List/home_screen.dart';
import 'package:animated_list_view/Animated%20SearchBar/animated_searchbar.dart';
import 'package:animated_list_view/Animated%20Slide%20List/slide_animated_list.dart';
import 'package:animated_list_view/constent.dart';
import 'package:flutter/material.dart';

import 'Instagram Like Animation/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: AnimatedContainer(
          color: Colors.white,
          duration: const Duration(milliseconds: 860),
          curve: Curves.bounceInOut,
          height: Constant.height(context),
          width: Constant.width(context),
          child: ListView(
            children: [
              Button(
                text: 'Part 1 - Scroll Animation',
                widget: const MyHomePage(title: 'Animated List View'),
              ),
              Button(
                text: 'part 2 - Slide Animated List',
                widget: const SlideAnimatedList(),
              ),
              Button(
                  text: 'part 3 - Instagram Like Animation',
                  widget: const InstagramLikeAnimation()),
              Button(
                text: 'Part 4 - Animated Search bar ',
                widget: const AnimatedSearchBar(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatefulWidget {
  Button({
    Key? key,
    required this.text,
    required this.widget,
  }) : super(key: key);
  String text;
  Widget widget;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget.widget,
            ));
      },
      child: AnimatedContainer(
        height: 60,
        margin: const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 7),
        duration: const Duration(seconds: 1),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1.4,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        transform: Matrix4.translationValues(
          widget.text.isEmpty ? MediaQuery.of(context).size.width : 0,
          0,
          0,
        ),
        curve: Curves.bounceInOut,
        child: Center(
          child: Text(
            widget.text,
            style: Constant.textStyle,
          ),
        ),
      ),
    );
  }
}
