import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return 
    Scaffold(
      appBar: AppBar(
            elevation: 0,
            toolbarHeight: 10,
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
          body:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Text("Settings"),
        ],
      ),
    ),
    );
  }
}
