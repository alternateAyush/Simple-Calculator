import 'package:calculator_task/home.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculate.dart';

void main() {
  runApp(const MyCalculator());
}

class MyCalculator extends StatelessWidget {
  const MyCalculator({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Calculate()),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
