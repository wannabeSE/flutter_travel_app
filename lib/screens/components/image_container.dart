import 'package:flutter/material.dart';
import 'package:travel_app/screens/components/mini_container.dart';
class ImageContainer extends StatelessWidget {
  final String imagePath, locationType, location;
  final String price, joinedPerson;
  final double containerHeight, containerWidth, upperInfoPadding, lowerInfoPadding, miniContainerHeight, miniContainerWidth;
  const ImageContainer({
    super.key,
    required this.imagePath, 
    required this.containerHeight, 
    required this.containerWidth, 
    required this.locationType, 
    required this.location, 
    required this.price, 
    required this.joinedPerson, 
    required this.upperInfoPadding, 
    required this.lowerInfoPadding, 
    required this.miniContainerHeight, 
    required this.miniContainerWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: containerHeight,
            width: containerWidth,
            decoration: BoxDecoration(
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
          upperInfoPadding: upperInfoPadding, 
          lowerInfoPadding: lowerInfoPadding, 
          miniContainerHeight: miniContainerHeight, 
          miniContainerWidth: miniContainerWidth
        )
      ],
    );
  }
}
