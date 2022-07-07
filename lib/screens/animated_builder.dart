import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedBuilderScreen extends StatefulWidget {
  const AnimatedBuilderScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderScreen> createState() => _AnimatedBuilderScreenState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _AnimatedBuilderScreenState extends State<AnimatedBuilderScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 10), vsync: this)
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: const Text('Animated Builder'),
        ),
        body: Center(
            child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
                angle: _controller.value * 2.0 * math.pi, child: child);
          },
          child: Container(
              color:
                  Colors.accents[math.Random().nextInt(Colors.accents.length)],
              child: Image.asset('assets/4stars.png')),
        )));
  }
}
