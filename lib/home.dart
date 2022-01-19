import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets.dart';
import 'calculator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color backColor = const Color(0xFFFCEDEA);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: color1,
            ),
            onPressed: () {
              Alert(
                context: context,
                type: AlertType.none,
                desc: "Are you sure you want to exit ?",
                buttons: [
                  DialogButton(
                    child: const Text(
                      "Exit",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    color: Colors.red,
                  ),
                  DialogButton(
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    color: Colors.grey,
                  )
                ],
              ).show();
            },
          ),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_vert, color: color1),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Settings()));
                    },
                    child: const ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                    ),
                  )),
                ];
              },
            )
          ],
        ),
        body: const Calculator(),
      ),
    );
  }
}
