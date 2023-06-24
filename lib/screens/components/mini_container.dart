import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';

class MiniContainer extends StatelessWidget {
  final String locationType;
  final int price, joinedPerson;
  final String location;
  final double upperInfoPadding, lowerInfoPadding, miniContainerHeight, miniContainerWidth;
  const MiniContainer({
    super.key,
    required this.locationType,
    required this.price,
    required this.location,
    required this.joinedPerson, 
    required this.upperInfoPadding, 
    required this.lowerInfoPadding, 
    required this.miniContainerHeight, 
    required this.miniContainerWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Container(
          height: miniContainerHeight,
          width: miniContainerWidth,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.82),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
                child: Row(
                  children: [
                    SizedBox(
                      height: 16,
                      width: 111,
                      child: Text(
                        locationType,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: sans,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      width: upperInfoPadding,
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
                    SizedBox(
                      width: lowerInfoPadding,
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
    );
  }
}