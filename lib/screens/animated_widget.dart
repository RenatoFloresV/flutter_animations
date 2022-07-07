import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedWidgetScreen extends StatefulWidget {
  const AnimatedWidgetScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedWidgetScreen> createState() => _AnimatedWidgetScreenState();
}

class _AnimatedWidgetScreenState extends State<AnimatedWidgetScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

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
            title: const Text('Animated Widget')),
        body: SpinningContainer(controller: _controller));
  }
}

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({
    Key? key,
    required AnimationController controller,
  }) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Center(
          child: Container(width: 300.0, height: 300.0, color: Colors.green)),
    );
  }
}


// class _AnimatedWidgetScreenState extends State<AnimatedWidgetScreen>
//     with SingleTickerProviderStateMixin {

//   AnimationController? _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigo,
//         centerTitle: true,
//         title: const Text('Animated Widget'),
//       ),
//       body: ButtonTransition(width: _controller),
//     );
//   }
// }

// class ButtonTransition extends AnimatedWidget {
//   const ButtonTransition({Key? key, width})
//       : super(key: key, listenable: width);
//   Animation<double>? get width => listenable as Animation<double>;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: OutlinedButton(
//             onPressed: () {},
//             child: const Text('Click me'),
//             style: OutlinedButton.styleFrom(
//                 primary: Colors.white,
//                 side: BorderSide(color: Colors.white, width: width!.value))));
//   }
// }
