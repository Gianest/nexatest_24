import 'package:flutter/material.dart';
import 'package:nexatest/navigation/login.dart';
import 'package:provider/provider.dart';

import 'data/provider/data_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MaterialApp(
        title: 'Dokterian',
        theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const LoginPage(), //NavigationMain(),
      ),
    );
  }
}
