import 'package:flutter/material.dart';
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/screens/listing_screen.dart';
import 'package:travel_app/screens/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashScreen',
      routes: {
        '/splashScreen' :(context) => const SplashScreen(),
        '/home' :(context) => const HomeScreen(),
        '/listing' :(context) => const ListingScreen()
      },
    )
  );
}

