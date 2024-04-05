import 'package:flutter/material.dart';
import 'package:namer_app/screens/home/home.dart';
import 'package:provider/provider.dart';

import 'bloc/page_controller_provider.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageControllerProvider(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightThemeColors(context),
        ),
        home: MyHomePage(),
      ),
    );
  }
}




