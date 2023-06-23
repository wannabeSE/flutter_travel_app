import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/dummy_data.dart';
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
                    child: IconContainer(
                      iconName: 'menu.svg',
                    )
                  ),
                Column(
                  children: [
                    Text('Location',
                        style: TextStyle(
                            fontFamily: sans,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
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
                  child: IconContainer(
                    iconName: 'notification.svg',
                  ),
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
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: index == 0 ? 197 : 146,
                          width: 155,
                          decoration: BoxDecoration(  
                            color: index == 0 ? firstPlaceContainerColor : placeContainerColor,
                            borderRadius: BorderRadius.circular(32)
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:15.0),
                                child: SizedBox(
                                  height: 50,
                                  width: 112,
                                  child: Text(
                                    '${dummyData[index]['container']['place']}\nPlace',
                                    style: TextStyle(
                                      fontFamily: sans,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: index == 0 ? Colors.black : Colors.white
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(27, 24, 0, 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: index == 0 ? SvgPicture.asset('assets/icons/arrow.svg') : const Padding(padding: EdgeInsets.zero),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:24.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 38,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          for(int i = 0; i < dummyData.length; i++)
                                          Align(
                                            widthFactor: 0.5,
                                            child: CircleAvatar(
                                              radius: 10,
                                              backgroundImage: AssetImage('assets/icons/${dummyData[i]['container']['image']}'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '${dummyData[index]['container']['suggestionNumber']}+',
                                      style: const TextStyle(
                                        fontFamily: sans,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
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
