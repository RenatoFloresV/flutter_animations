import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedSizeScreen extends StatefulWidget {
  const AnimatedSizeScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedSizeScreen> createState() => _AnimatedSizeScreenState();
}

class _AnimatedSizeScreenState extends State<AnimatedSizeScreen> {
  double _size = 50.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 100.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigo,
            centerTitle: true,
            title: const Text('Animated Size')),
        body: Center(
          child: GestureDetector(
              onTap: () => _updateSize(),
              child: Container(
                  color: Colors
                      .accents[math.Random().nextInt(Colors.accents.length)],
                  child: AnimatedSize(
                      curve: Curves.easeIn,
                      duration: const Duration(seconds: 2),
                      child: FlutterLogo(size: _size)))),
        ));
  }
}
