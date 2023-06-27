import 'package:flutter/material.dart';
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/screens/listing_screen.dart';
import 'package:travel_app/screens/profile_screen.dart';
import 'package:travel_app/screens/splash_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screens = const [
    HomeScreen(),
    SplashScreen(),
    ListingScreen(),
    ProfileScreen()
  ];
  List bottomNavbarElement = [
  'new_discovery.png',
  'send.png',
  'bookmark.png',
  'profile.png'
];
  int currentSelectedIndex = 0;
  Color activeColor = Colors.white;
  Color inactiveColor = Colors.white.withOpacity(0.3);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentSelectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
        child: Stack(
          children: [
            Container(
              height: 70,
              width: 327,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(35)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(41, 23, 50, 15),
              child: SizedBox(
                  height: 32,
                  width: 246,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              currentSelectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding: index == 4
                                ? EdgeInsets.zero
                                : const EdgeInsets.only(right: 50.0),
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: const BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/${bottomNavbarElement[index]}',
                                    //color: Colors.black,
                                    color: index == currentSelectedIndex
                                        ? activeColor
                                        : inactiveColor,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Image.asset(
                                    'assets/icons/nav_ellipse.png',
                                    color: index == currentSelectedIndex 
                                    ? activeColor 
                                    : Colors.black,
                                    height: 4,
                                    width: 4,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    )
                  )
                ),
            ),
          ],
        ),
      ),
    );
  }
}
