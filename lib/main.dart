import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'screens/index.dart';

void main() {
  //Keep Splash Screen until initialisation has completed
  // ignore: deprecated_member_use
  FlutterNativeSplash.removeAfter(initialization);
  runApp(
    const MyApp(),
  );
}

Future initialization(BuildContext context) async {
  // do initialization work
  return Future.delayed(const Duration(seconds: 1));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: const Text('Animations'),
        ),
        body: Container(
            padding: const EdgeInsets.all(8.0),
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(context, 'AlignAnimation', const AlignScreen()),
                    button(context, 'AnimatedBuilder',
                        const AnimatedBuilderScreen()),
                    button(context, 'AnimatedContainer',
                        const AnimatedContainerScreen()),
                    button(context, 'AnimatedCrossFade',
                        const AnimatedCrossFadeScreen()),
                    button(context, 'AnimatedDefaultTextStyle',
                        const AnimatedDefaultTextStyleScreen()),
                    button(context, 'AnimatedListState',
                        const AnimatedListStateScreen()),
                    button(context, 'AnimatedModalBarrier',
                        const AnimatedModalBarrierScreen()),
                    button(context, 'AnimatedOpacity',
                        const AnimatedOpacityScreen()),
                    button(context, 'AnimatedPshysicalModel',
                        const AnimatedPhysicalModelScreen()),
                    button(context, 'AnimatedPositioned',
                        const AnimatedPositionedScreen()),
                    button(context, 'AnimatedSize', const AnimatedSizeScreen()),
                    button(context, 'AnimatedWidget',
                        const AnimatedWidgetScreen()),
                  ]),
            )));
  }

  Widget button(context, String text, route) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 200,
          minHeight: 30,
        ),
        child: ElevatedButton(
          onPressed: (() {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => route));
          }),
          child: Text(text),
        ),
      ),
    );
  }
}
