import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';
import 'package:travel_app/screens/components/icon_container.dart';
import 'package:travel_app/screens/components/image_container.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: IconContainer(
                      iconName: 'arrow_left.svg',
                    ),
                  ),
                  SizedBox(
                    width: 116.5,
                  ),
                  Text(
                    'Details',
                    style: TextStyle(
                        fontFamily: sans,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 104,
                  ),
                  IconContainer(iconName: 'bookmark.svg')
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(32, 30, 0, 16),
                child: ImageContainer(
                    imagePath: 'leaf.png',
                    containerHeight: 199,
                    containerWidth: 327),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 23.0),
                child: Text(
                  'Northern Forest',
                  style: TextStyle(
                      fontFamily: sans, fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 0, 26),
                child: Row(
                  children: [
                    SizedBox(
                      height: 16,
                      width: 59,
                      child: Row(
                        children: [
                          SvgPicture.asset('${defaultIconLocation}location.svg'),
                          const Text(
                            'Alaska',
                            style: TextStyle(
                                fontFamily: sans,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 42,
                    ),
                    SizedBox(
                      height: 16,
                      width: 75,
                      child: Row(
                        children: [
                          SvgPicture.asset('${defaultIconLocation}profile.svg'),
                          const Text(
                            '12 Joined',
                            style: TextStyle(
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
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 0, 24),
                child: SizedBox(
                  height: 160,
                  width: 327,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 160,
                            width: 156,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: searchBarColor,
                                boxShadow:const [
                                  BoxShadow(
                                    color: Color(0x0a141513),
                                    blurRadius: 25,
                                    offset: Offset(0, 4),
                                  )
                                ]
                              ),
                              
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 32, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    '${defaultIconLocation}itinerary.png',
                                    height: 48,
                                    width: 48,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: SizedBox(
                                      height: 44,
                                      width: 77.5,
                                      child: Text(
                                        'Choose\nDates',
                                        style: TextStyle(
                                            fontFamily: sans,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Column(
                        children: [
                          DetailsMiniInfoContainer(
                            imageName: 'weather.png',
                            text: 'Mon 07 Oct',
                            value: '24°',
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          DetailsMiniInfoContainer(
                              text: 'Package Start',
                              imageName: 'save_money.png',
                              value: '\$124')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'About Destination',
                  style: TextStyle(
                      fontFamily: sans, fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                    child: ExpandTextWidget(
                      text:
                        'Denali also known as Mount McKinley, its the official name. Which is the highest mountain peak in North America.',
                    ),
                )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 31),
                child: SizedBox(
                  height: 70,
                  width: 327,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)
                      )
                    ),
                    onPressed: (){}, 
                    child: const Text(
                      'Book Now',
                      style: TextStyle(
                        fontFamily: sans,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),
                    )
                  ),
                ),
              )
          ],
        )
      ),
    );
  }
}

class ExpandTextWidget extends StatefulWidget {
  final String text;
  const ExpandTextWidget({
    super.key,
    required this.text,
  });

  @override
  State<ExpandTextWidget> createState() => _ExpandTextWidgetState();
}

class _ExpandTextWidgetState extends State<ExpandTextWidget> {

  late String firstHalfText, secondHalfText;
  bool flag = false;

  @override
  void initState() {
    if (widget.text.length > 50) {
      firstHalfText = widget.text.substring(0, 50);
      secondHalfText = widget.text.substring(51, widget.text.length);
    } else {
      firstHalfText = widget.text;
      secondHalfText.isEmpty;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 16, 23, 29),
      child: Container(
        child: secondHalfText.isEmpty
            ? Text(widget.text)
            : Column(
                children: [
                  Text(
                    flag ? firstHalfText : widget.text
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                        child: const Text(
                          '...Read More',
                          style: TextStyle(
                              fontFamily: sans,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}

class DetailsMiniInfoContainer extends StatelessWidget {
  final String text, imageName, value;
  const DetailsMiniInfoContainer({
    super.key,
    required this.text,
    required this.imageName,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 72,
          width: 155,
          decoration: BoxDecoration(
              color: firstPlaceContainerColor,
              borderRadius: BorderRadius.circular(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
                child: Text(
                  text,
                  style: const TextStyle(
                      fontFamily: sans,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Image.asset('$defaultIconLocation$imageName'),
                    const SizedBox(
                      width: 11,
                    ),
                    Text(
                      value,
                      style: const TextStyle(
                          fontFamily: sans,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}