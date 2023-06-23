import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/fonts_and_colors.dart';

class PlaceContainer extends StatelessWidget {
  const PlaceContainer({
    required this.imagePath,
    required this.locationType,
    required this.location,
    required this.price,
    required this.joinedPerson,
    super.key,
  });
  final String imagePath, locationType, location;
  final int price, joinedPerson;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            //margin: EdgeInsets.all(8),
            height: 201,
            width: 240,
            decoration: BoxDecoration(
              //color: Colors.amber,
              borderRadius: BorderRadius.circular(32),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/icons/$imagePath',
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 0, 24),
            child: Container(
              height: 72,
              width: 208,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.82),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                    child: Row(
                      children: [
                        Text(
                          locationType,
                          style: const TextStyle(
                              fontFamily: sans,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 29,
                        ),
                        Text(
                          '\$$price',
                          style: const TextStyle(
                              fontFamily: sans,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/location.svg'),
                        Text(
                          location,
                          style: const TextStyle(
                              fontFamily: sans,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 42,
                        ),
                        SvgPicture.asset('assets/icons/profile.svg'),
                        Text(
                          '$joinedPerson joined',
                          style: const TextStyle(
                              fontFamily: sans,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}