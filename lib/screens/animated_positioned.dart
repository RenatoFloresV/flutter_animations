import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedPositionedScreen extends StatefulWidget {
  const AnimatedPositionedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionedScreen> createState() =>
      _AnimatedPositionedScreenState();
}

class _AnimatedPositionedScreenState extends State<AnimatedPositionedScreen> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigo,
            centerTitle: true,
            title: const Text('Animated Positioned')),
        body: Center(
          child: SizedBox(
              width: 200,
              height: 350,
              child: Stack(children: <Widget>[
                AnimatedPositioned(
                    width: _selected ? 200.0 : 150.0,
                    height: _selected ? 100.0 : 200.0,
                    top: _selected ? 100.0 : 150.0,
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selected = !_selected;
                          });
                        },
                        child: Container(
                            color: Colors.accents[
                                math.Random().nextInt(Colors.accents.length)],
                            child: const Center(
                                child: Text(
                              'Touch me',
                              style: TextStyle(fontSize: 25),
                            )))))
              ])),
        ));
  }
}
