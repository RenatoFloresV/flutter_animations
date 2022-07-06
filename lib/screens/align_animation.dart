import 'package:flutter/material.dart';

class AlignScreen extends StatefulWidget {
  const AlignScreen({Key? key}) : super(key: key);

  @override
  State<AlignScreen> createState() => _AlignScreenState();
}

class _AlignScreenState extends State<AlignScreen> {
  bool _isMoved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text('Align Animation'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: AnimatedAlign(
          alignment: _isMoved ? Alignment.topRight : Alignment.bottomLeft,
          duration: const Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Image.asset('assets/4stars.png'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          setState(() {
            _isMoved = !_isMoved;
          });
        },
        child: Icon(_isMoved ? Icons.move_down : Icons.move_up),
      ),
    );
  }
}
