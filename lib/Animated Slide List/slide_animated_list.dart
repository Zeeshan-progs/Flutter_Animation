import 'dart:ui';

import 'package:animated_list_view/constent.dart';
import 'package:animated_list_view/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideAnimatedList extends StatefulWidget {
  const SlideAnimatedList({Key? key}) : super(key: key);

  @override
  _SlideAnimatedListState createState() => _SlideAnimatedListState();
}

class _SlideAnimatedListState extends State<SlideAnimatedList> {
  @override

  // lets start
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Slide Animated List ',
          style: Constant.textStyle.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox(
        height: Constant.height(context),
        width: Constant.width(context),
        child: ListView.builder(
          itemBuilder: (context, index) => buildContainer(index),
          itemCount: images.length,
        ),
      ),
    );
  }

  Widget buildContainer(int index) {
    /// lets add some animation
    /// lets add tween some some
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 760 + index),
      tween: Tween(begin: -1, end: 0.5),
      builder: (context, value, child) => Transform.translate(
        offset: Offset(value * 200 - 100, 0),
        child: child,
      ),
      child: Container(
        height: 160,
        width: Constant.width(context),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.network(
            images[index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// thank you
// like
// share
// subscribe for more
