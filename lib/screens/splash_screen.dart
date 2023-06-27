import 'package:flutter/material.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  final TextStyle textStyle = const TextStyle(
    fontFamily: sans,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Image.asset(
              'assets/icons/splash.png',
              scale: 0.8,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              width: 327,
              decoration: BoxDecoration(
                  color: dialogBoxColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(32)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(52, 24, 51, 16),
                    child: SizedBox(
                      width: 224,
                      child: Text(
                        'Go explore\nOut there',
                        textAlign: TextAlign.center,
                        style: textStyle,
                      ),
                    ),
                  ),
                  const Text(
                    'Best solution for your tour\nvacation camping',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: sans,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: SizedBox(
                        height: 70,
                        width: 279,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/main');
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35))),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                                fontFamily: sans,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
