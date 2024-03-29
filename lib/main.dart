import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override 
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  late WordPair _current = WordPair.random();

  WordPair get current => _current;

  void getNext() {
    _current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('A random idea'),
          Consumer<MyAppState>(
            builder: (context, appState, _) {
              return Text(appState.current.asLowerCase);
            },
          ),
          ElevatedButton(
            onPressed: () {
              context.read<MyAppState>().getNext();
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
