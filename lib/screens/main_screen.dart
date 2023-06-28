import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding: EdgeInsets.fromLTRB(24.w, 18.h, 24.w, 24.h),
        child: Stack(
          children: [
            Container(
              height: 70.h,
              width: 327.w,
              decoration: BoxDecoration(
                  color: Colors.black, 
                  borderRadius: BorderRadius.circular(35.r)
                ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(41.w, 23.h, 40.w, 15.h),
              child: SizedBox(
                  height: 32.h,
                  width: 246.w,
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
                          child: Container(
                            height: 24.h,
                            width: 24.w,
                            margin: EdgeInsets.only(right: 50.w,),
                            decoration: const BoxDecoration(
                              color: Colors.black, 
                              shape: BoxShape.circle
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icons/${bottomNavbarElement[index]}',
                                  //color: Colors.black,
                                  color: index == currentSelectedIndex
                                      ? activeColor
                                      : inactiveColor,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Image.asset(
                                  'assets/icons/nav_ellipse.png',
                                  color: index == currentSelectedIndex 
                                  ? activeColor 
                                  : Colors.black,
                                  height: 4.h,
                                  width: 4.w,
                                )
                              ],
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
