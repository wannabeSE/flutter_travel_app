import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imagePath;
  final double containerHeight, containerWidth;
  const ImageContainer({
    super.key,
    required this.imagePath, 
    required this.containerHeight, 
    required this.containerWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
