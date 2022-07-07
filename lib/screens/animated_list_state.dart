import 'package:flutter/material.dart';

class AnimatedListStateScreen extends StatefulWidget {
  const AnimatedListStateScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedListStateScreen> createState() =>
      _AnimatedListStateScreenState();
}

class _AnimatedListStateScreenState extends State<AnimatedListStateScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: const Text('Animated List State'),
        ),
        body: AnimatedList(
            key: _listKey,
            initialItemCount: _items.length,
            itemBuilder: (context, index, animation) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: SlideTransition(
                          position: animation.drive(Tween<Offset>(
                            begin: const Offset(0.0, 1.0),
                            end: const Offset(0.0, 0.0),
                          )),
                          child: Text(
                            _items[index],
                            style: const TextStyle(fontSize: 25),
                          ))));
            }),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          FloatingActionButton(
              onPressed: () {
                _items.add('Item ${_items.length + 1}');
                _listKey.currentState!.insertItem(_items.length - 1,
                    duration: const Duration(seconds: 2));
              },
              child: const Icon(Icons.add)),
          const SizedBox(width: 10),
          FloatingActionButton(
              onPressed: () {
                _items.removeAt(0);
                _listKey.currentState!.removeItem(
                    0,
                    (context, animation) => SizedBox(
                        child: FadeTransition(
                            opacity: animation,
                            child: Center(
                                child: Text(_items[0],
                                    style: const TextStyle(fontSize: 25))))),
                    duration: const Duration(seconds: 2));
              },
              child: const Icon(Icons.remove))
        ]));
  }
}
