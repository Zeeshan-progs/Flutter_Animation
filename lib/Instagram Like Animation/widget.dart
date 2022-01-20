import 'package:animated_list_view/constent.dart';
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class InstagramLikeAnimation extends StatefulWidget {
  const InstagramLikeAnimation({Key? key}) : super(key: key);

  @override
  _InstagramLikeAnimationState createState() => _InstagramLikeAnimationState();
}

class _InstagramLikeAnimationState extends State<InstagramLikeAnimation> {
  bool visibility = false;
  bool isIconTapped = false;
  void setTimeVisibility() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        visibility = false;
      });
    });
  }

  Animation<double>? animation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram Like Animation ',
          style: Constant.textStyle,
        ),
      ),
      body: SizedBox(
        height: Constant.height(context),
        width: Constant.width(context),
        child: Column(
          children: [
            InkWell(
              child: SizedBox(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      images.first,
                      fit: BoxFit.cover,
                    ),
                    Visibility(
                        visible: visibility,
                        child: Animator<double>(
                          curve: Curves.elasticInOut,
                          duration: const Duration(milliseconds: 150),
                          tween: Tween(begin: 5, end: 25),
                          repeats: 1,
                          endAnimationListener: (p0) {
                            debugPrint("${p0.controller.status}");
                          },
                          builder: (BuildContext context,
                              AnimatorState<double> animatorState,
                              Widget? child) {
                            return Icon(
                              Icons.favorite,
                              color: Colors.grey.shade200,
                              size: animatorState.value * 5,
                            );
                          },
                        )),
                  ],
                ),
                height: Constant.height(context) / 3,
                width: Constant.width(context),
              ),
              onDoubleTap: () {
                setState(() {
                  isIconTapped = !isIconTapped;

                  visibility = true;
                });
                setTimeVisibility();
              },
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        isIconTapped = !isIconTapped;
                        visibility = true;
                      });
                      setTimeVisibility();
                    },
                    icon: Icon(
                      isIconTapped ? Icons.favorite : Icons.favorite_border,
                      color: isIconTapped ? Colors.lightBlue : Colors.black,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
