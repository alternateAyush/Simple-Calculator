import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(),
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const Center(
          child: Icon(
            Icons.settings,
            size: 200,
          ),
        ),
      ),
    );
  }
}
