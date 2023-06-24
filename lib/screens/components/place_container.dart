import 'package:flutter/material.dart';
import 'package:travel_app/screens/components/image_container.dart';
import 'package:travel_app/screens/components/mini_container.dart';

class PlaceContainer extends StatelessWidget {
  final String imagePath, locationType, location;
  final int price, joinedPerson;
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
          child: ImageContainer(
            imagePath: imagePath,
            containerHeight: 201,
            containerWidth: 240,
          ),
        ),
        MiniContainer(
          locationType: locationType,
          price: price,
          location: location,
          joinedPerson: joinedPerson,
          miniContainerHeight: 72,
          miniContainerWidth: 208,
          upperInfoPadding: 29,
          lowerInfoPadding: 42,
        )
      ],
    );
  }
}

