import 'package:flutter/material.dart';
import 'package:app_custom/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 255, 255),
          background: Colors.white,
        ),
      ),
      title: 'Cuwustom - ¡Personliza lo que quieras!',
      home: const MainScreen(),
    );
  }
}