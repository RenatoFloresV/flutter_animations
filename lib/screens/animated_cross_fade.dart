import 'package:flutter/material.dart';

class AnimatedCrossFadeScreen extends StatefulWidget {
  const AnimatedCrossFadeScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadeScreen> createState() =>
      _AnimatedCrossFadeScreenState();
}

class _AnimatedCrossFadeScreenState extends State<AnimatedCrossFadeScreen> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text('Animated Cross Fade'),
      ),
      body: Center(
          child: AnimatedCrossFade(
        firstChild:
            Image.asset('assets/4stars_white.png', width: 200.0, height: 200.0),
        secondChild:
            Image.asset('assets/4stars.png', width: 200.0, height: 200.0),
        crossFadeState:
            _selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(seconds: 2),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selected = !_selected;
          });
        },
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}
