import 'package:flutter/material.dart';

class AnimatedModalBarrierScreen extends StatefulWidget {
  const AnimatedModalBarrierScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedModalBarrierScreen> createState() =>
      _AnimatedModalBarrierScreenState();
}

class _AnimatedModalBarrierScreenState
    extends State<AnimatedModalBarrierScreen> {
  var _dismissable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: const Text('Animated Modal Barrier'),
        ),
        body: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Disable dismissable'),
                    Switch(
                        value: _dismissable,
                        onChanged: (value) {
                          setState(() {
                            _dismissable = value;
                          });
                        }),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MyPageRoute(
                        page: _ModalPage(), dismissible: _dismissable));
                  },
                  child: const Text('Open modal'),
                ),
              ],
            )));
  }
}

class MyPageRoute extends TransitionRoute {
  MyPageRoute({
    required this.page,
    required this.dismissible,
  });
  final Widget page;
  final bool dismissible;

  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    return [
      OverlayEntry(
        builder: _buildModalBarrier,
      ),
      OverlayEntry(builder: ((context) => Center(child: page))),
    ];
  }

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  Widget _buildModalBarrier(BuildContext context) {
    return IgnorePointer(
      ignoring: animation?.status == AnimationStatus.reverse ||
          animation?.status == AnimationStatus.dismissed,
      child: AnimatedModalBarrier(
        dismissible: dismissible,
        color: animation!.drive(ColorTween(
            begin: Colors.transparent, end: Colors.black.withAlpha(80))),
      ),
    );
  }
}

class _ModalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Image.asset('assets/4stars.png'),
              ElevatedButton(
                  onPressed: (() {
                    Navigator.of(context).pop();
                  }),
                  child: const Text('Close')),
            ])));
  }
}
