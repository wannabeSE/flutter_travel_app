import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/dummy_data.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';
import 'package:travel_app/screens/components/icon_container.dart';
import 'package:travel_app/screens/components/image_container.dart';
import 'package:travel_app/screens/components/place_container.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const IconContainer(
                        iconName: 'arrow_left.svg'
                    )
                  ),
                ),
                const SizedBox(
                  width: 85,
                ),
                const Text(
                  'Natural Place',
                  style: TextStyle(
                      fontFamily: sans,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 30, 0, 24),
              child: ListOfCategoryContainers(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  const SizedBox(
                    height: 25,
                    width: 177,
                    child: Text(
                      'Popular in Quite Place',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: sans,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    width: 102,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          fontFamily: sans,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54
                        ),
                      )
                    )
                ],
              ),
            ),
            SizedBox(
              height: 206,
              width: 368,
              child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        PlaceContainer(
                          imagePath: locationData[index]['image'],
                          locationType: locationData[index]['name'],
                          location: locationData[index]['point'],
                          price: locationData[index]['price'],
                          joinedPerson: locationData[index]['joined'],
                        )
                      ],
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(23, 23, 0, 10),
              child: Text(
                'All Natural Places',
                style: TextStyle(
                    fontFamily: sans,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 218,
              width: 394,
              child: ImageContainer(
                imagePath: 'moon.png', 
                containerHeight: 201, 
                containerWidth: 327,
                locationType: 'Dark Mountain',
                price: 165,
                location: 'Pennsylvania',
                joinedPerson: 12,
                upperInfoPadding: 110,
                lowerInfoPadding: 15,
                miniContainerHeight: 72,
                miniContainerWidth: 295
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListOfCategoryContainers extends StatefulWidget {
  const ListOfCategoryContainers({
    super.key,
  });
  
  @override
  State<ListOfCategoryContainers> createState() =>
      _ListOfCategoryContainersState();
}

class _ListOfCategoryContainersState extends State<ListOfCategoryContainers> {
  int selectedIndex = -1;
  List categories = ['All', 'Mountain', 'Forest', 'Hills'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 456,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: index == 1 ? 126 : 88,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: index == selectedIndex
                                ? categoryActiveColor
                                : categoryMainColor,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          color: index == selectedIndex
                            ? categoryActiveColor
                            : null
                            ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/menu.svg',
                            color: index == selectedIndex
                                ? categoryActiveIconFontColor
                                : categoryMainColor,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            categories[index],
                            style: TextStyle(
                              fontFamily: sans,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: index == selectedIndex
                                ? categoryActiveIconFontColor
                                : categoryMainColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        ),
    );
  }
}
