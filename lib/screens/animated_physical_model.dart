import 'package:flutter/material.dart';

class AnimatedPhysicalModelScreen extends StatefulWidget {
  const AnimatedPhysicalModelScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedPhysicalModelScreen> createState() =>
      _AnimatedPhysicalModelScreenState();
}

class _AnimatedPhysicalModelScreenState
    extends State<AnimatedPhysicalModelScreen> {
  bool _play = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: const Text('Animated Physical Model')),
      body: Center(
          child: AnimatedPhysicalModel(
              duration: const Duration(seconds: 2),
              color: _play ? Colors.green : Colors.purple,
              elevation: _play ? 50 : 25,
              shape: BoxShape.rectangle,
              shadowColor: Colors.white,
              borderRadius: _play
                  ? const BorderRadius.all(Radius.circular(0))
                  : const BorderRadius.all(Radius.circular(24)),
              child: const SizedBox(
                  width: 250,
                  height: 250,
                  child: Center(
                      child: Text(
                    'AnimatedPhysicalModel',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ))))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _play = !_play;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
