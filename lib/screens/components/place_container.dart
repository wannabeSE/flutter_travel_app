import 'package:flutter/material.dart';
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


