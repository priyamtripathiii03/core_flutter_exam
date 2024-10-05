import 'package:core_flutter_exam/screens/edit_page.dart';
import 'package:core_flutter_exam/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/add': (context) => const DetailPage(),
      },
    );
  }
}
