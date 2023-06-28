import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/screens/main_screen.dart';
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/screens/listing_screen.dart';
import 'package:travel_app/screens/profile_screen.dart';
import 'package:travel_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
  Widget build(BuildContext context){
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      //designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/splashScreen',
          routes: {
            '/splashScreen' :(context) => const SplashScreen(),
            '/main' :(context) => const MainScreen(),
            '/home' :(context) => const HomeScreen(),
            '/listing' :(context) => const ListingScreen(),
            '/profile' : (context) => const ProfileScreen(),
            
          },
        );
      }
    );
  }
}
//     ScreenUtilInit(
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         initialRoute: '/splashScreen',
//         routes: {
//           '/splashScreen' :(context) => const SplashScreen(),
//           '/main' :(context) => const MainScreen(),
//           '/home' :(context) => const HomeScreen(),
//           '/listing' :(context) => const ListingScreen(),
//           '/profile' : (context) => const ProfileScreen(),
          
//         },
//       ),
//     )
//   );
// }

