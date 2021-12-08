import 'dart:math';

import 'package:flutter/material.dart';
import '../data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  double space = 5.0;
  final _duration = const Duration(milliseconds: 460);
  _onStartScroll(ScrollMetrics metrics) {
    setState(() {
      space = 10.0;
    });
    return space;
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    setState(() {
      space = 25;
    });
    return space;
  }

  _onEndScroll(ScrollMetrics metrics) {
    setState(() {
      space = 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scroll) {
          if (scroll is ScrollStartNotification) {
            _onStartScroll(scroll.metrics);
          }
          if (scroll is ScrollUpdateNotification) {
            _onUpdateScroll(scroll.metrics);
          }
          if (scroll is ScrollEndNotification) {
            _onEndScroll(scroll.metrics);
          }

          return true;
        },
        child: ListView(
          children: List.generate(images.length, (index) => fadeWidget(index)),
        ),
      ),
    );
  }

  Widget fadeWidget(
    int index,
  ) {
    return AnimatedContainer(
      curve: Curves.ease,
      duration: _duration,
      child: Card(
        color: Color.fromARGB(Random().nextInt(250), Random().nextInt(150),
                Random().nextInt(50), Random().nextInt(25))
            .withOpacity(.3),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: space),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        shadowColor: Colors.black12,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.network(
            images[index],
            height: height(context) / 4,
            width: width(context),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

double height(context) {
  return MediaQuery.of(context).size.height;
}

double width(context) {
  return MediaQuery.of(context).size.width;
}
