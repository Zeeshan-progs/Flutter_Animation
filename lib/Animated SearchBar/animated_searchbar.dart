import 'package:animated_list_view/constent.dart';
import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({Key? key}) : super(key: key);

  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool toggle = true;
  void doToggle() {
    toggle = !toggle;
  }

  void onTap() {
    setState(doToggle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: kToolbarHeight,
            width: Constant.width(context),
            child: Stack(
              children: [
                AnimatedOpacity(
                    duration: const Duration(milliseconds: 450),
                    opacity: !toggle ? 0 : 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(child: Text('Animated  Search bar')),
                        IconButton(
                            onPressed: onTap, icon: const Icon(Icons.search)),
                      ],
                    )),
                AnimatedContainer(
                  width: !toggle ? Constant.width(context) : 0,
                  duration: const Duration(seconds: 1),
                  transform: Matrix4.translationValues(
                      toggle ? Constant.width(context) : 0, 0, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: GestureDetector(
                          onTap: onTap,
                          child: const Icon(Icons.arrow_back_ios)),
                      hintText: 'Search ....',
                      hintStyle: Constant.textStyle,
                      fillColor: Colors.white.withOpacity(0.4),
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/// thank you guys 
/// 
/// 
/// 