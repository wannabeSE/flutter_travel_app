import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 32.0),
                  child: IconContainer(iconName: 'menu.svg',)
                ),
                Column(
                  children: [
                    Text(
                      'Location',
                        style: TextStyle(
                          fontFamily: sans,
                          fontSize: 12,
                          fontWeight: FontWeight.w400
                      )
                    ),
                    Text(
                      'South City,Florida',
                      style: TextStyle(
                          fontFamily: sans,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 32.0),
                  child: IconContainer(iconName: 'notification.svg',),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                height: 48,
                width: 327,
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: searchBarColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none
                    ),
                    hintText: 'Search Destination',
                    hintStyle: const TextStyle(
                      fontFamily: sans,
                      fontSize: 12,
                      fontWeight: FontWeight.w400
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Align(
                        widthFactor: 0.2,
                        heightFactor: 1,
                        child: SvgPicture.asset(
                          'assets/icons/search.svg',
                          
                        ),
                      ),
                    )
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 95),
              child: Text(
                'Where do you want to be?',
                  style: TextStyle(
                    fontFamily: sans,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  )
                ),
            )
          ],
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  const IconContainer({
    required this.iconName,
    super.key,
  });
  final String iconName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      decoration: const BoxDecoration(color: iconsBackgroundColor),
      child: SvgPicture.asset(
        'assets/icons/$iconName',
      ),
    );
  }
}
