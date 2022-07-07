import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleScreen extends StatefulWidget {
  const AnimatedDefaultTextStyleScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedDefaultTextStyleScreen> createState() =>
      _AnimatedDefaultTextStyleScreenState();
}

class _AnimatedDefaultTextStyleScreenState
    extends State<AnimatedDefaultTextStyleScreen> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: const Text('Animated Default Text Style'),
        ),
        body: Center(
            child: AnimatedDefaultTextStyle(
                child: const Text('Animated Defauld Text Style'),
                style: _isSelected
                    ? const TextStyle(
                        fontSize: 75.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold)
                    : const TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w100),
                duration: const Duration(seconds: 1))),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _isSelected = !_isSelected;
              });
            },
            child: const Icon(Icons.swap_horiz)));
  }
}
