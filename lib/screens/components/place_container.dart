import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:travel_app/screens/components/mini_container.dart';

class PlaceContainer extends StatelessWidget {
  final String imagePath, locationType, location;
  final String price, joinedPerson;
  const PlaceContainer({
    required this.imagePath,
    required this.locationType,
    required this.location,
    required this.price,
    required this.joinedPerson,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 201.h,
              width: 240.w,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/icons/$imagePath',
                ),
              ),
            )
          ),
        ),
        MiniContainer(
          locationType: locationType,
          price: price,
          location: location,
          joinedPerson: joinedPerson,
          miniContainerHeight: 72.h,
          miniContainerWidth: 208.w,
          upperInfoPadding: 29.sp,
          lowerInfoPadding: 42.sp,
        )
      ],
    );
  }
}

