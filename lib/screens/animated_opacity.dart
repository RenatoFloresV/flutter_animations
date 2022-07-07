import 'package:flutter/material.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0.0 ? 1.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: const Text('Animated Opacity'),
        ),
        body: Center(
            child: Column(    
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              AnimatedOpacity(
                opacity: opacityLevel,
                duration: const Duration(seconds: 3),
                child: Image.asset('assets/4stars.png'),
              ),
              ElevatedButton(
                onPressed: _changeOpacity,
                child: const Text('Change opacity'),
              )
            ])));
  }
}
