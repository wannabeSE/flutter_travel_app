import 'package:flutter/material.dart';
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/screens/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/splashScreen' :(context) => const SplashScreen(),
        '/home' :(context) => const HomeScreen(),
      },
    )
  );
}

