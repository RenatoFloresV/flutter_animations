import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: const Text('Animated Builder'),
        ),
        body: GestureDetector(
            onTap: () {
              setState(() {
                _selected = !_selected;
              });
            },
            child: Center(
                child: AnimatedContainer(
              width: _selected ? 200.0 : 100.0,
              height: _selected ? 100.0 : 200.0,
              color:
                  Colors.accents[math.Random().nextInt(Colors.accents.length)],
              alignment:
                  _selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: Image.asset('assets/4stars.png'),
            ))));
  }
}
