import 'dart:math';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(),
      debugShowFloatingThemeButton: true, // <------ add this line
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        home: RandomNumberGenerator(),
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class RandomNumberGenerator extends StatefulWidget {
  @override
  _RandomNumberGeneratorState createState() => _RandomNumberGeneratorState();
}

class _RandomNumberGeneratorState extends State<RandomNumberGenerator> {
  final Random _random = Random();
  int _randomNumber = 0;

  void generateRandomNumber() {
    setState(() {
      _randomNumber = _random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lucky Number Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lucky Number:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_randomNumber',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateRandomNumber,
              child: Text('Generate the Number'),
            ),
          ],
        ),
      ),
    );
  }
}
