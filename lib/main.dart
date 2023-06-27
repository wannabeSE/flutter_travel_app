import 'package:flutter/material.dart';
import 'package:travel_app/screens/main_screen.dart';
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/screens/listing_screen.dart';
import 'package:travel_app/screens/profile_screen.dart';
import 'package:travel_app/screens/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashScreen',
      routes: {
        '/splashScreen' :(context) => const SplashScreen(),
        '/main' :(context) => const MainScreen(),
        '/home' :(context) => const HomeScreen(),
        '/listing' :(context) => const ListingScreen(),
        '/profile' : (context) => const ProfileScreen(),
        
      },
    )
  );
}

