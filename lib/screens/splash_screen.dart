import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';

import '../shared/text_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 812.h,
            width: 375.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/icons/splash.png')
              )
            ),
          ),

        Padding(
          padding: EdgeInsets.all(24.sp),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300.h,
              width: 327.w,
              decoration: BoxDecoration(
                  color: dialogBoxColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(32.sp)
                ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(52.sp, 24.sp, 51.sp, 16.sp),
                    child: SizedBox(
                      width: 224.w,
                      child: Text(
                        'Go explore\nOut there',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: sans,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Best solution for your tour\nvacation camping',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: sans,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(24.sp),
                    child: SizedBox(
                        height: 70.h,
                        width: 279.w,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/main');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.sp)
                            )
                          ),
                          child: SemiBoldText(
                            text: 'Get Started', 
                            fontSize: 20.sp
                          ),
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}
