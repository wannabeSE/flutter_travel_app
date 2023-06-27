import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';
import 'package:travel_app/screens/components/appbar_widget.dart';
import 'package:travel_app/screens/components/image_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const AppBarWidget(
              leftIconPath: 'arrow_left.svg',
              text: 'My Profile',
              rightIconPath: 'bookmark.svg',
              leftIconDistance: 101,
              rightIconDistance: 87),
          const SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                    color: circularContainerColorWithOpacity,
                    shape: BoxShape.circle),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: circleAvatarColor,
                  foregroundImage: AssetImage('assets/icons/dp.png'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Sam Smith',
            style: TextStyle(
                fontFamily: sans, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Premium Member',
            style: TextStyle(
                fontFamily: sans,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff9c9c9c)),
          ),
          const SizedBox(
            height: 24,
          ),
          const SizedBox(
            width: 156,
            child: Row(
              children: [
                SocialIconContainer(
                  iconName: 'facebook.svg',
                ),
                SocialIconContainer(
                  iconName: 'twitter.svg',
                ),
                SocialIconContainer(
                  iconName: 'instagram.svg',
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const SizedBox(height: 32, width: 236, child: ProfileElements()),
          const SizedBox(
            height: 24,
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
      )),
    );
  }
}

class ProfileElements extends StatefulWidget {
  const ProfileElements({
    super.key,
  });

  @override
  State<ProfileElements> createState() => _ProfileElementsState();
}

int selectedIndex = 0;
Color activeColor = Colors.black;
Color inactiveColor = const Color(0xff9c9c9c);
List profileElements = ['Favorites', 'Wallet', 'About'];
class _ProfileElementsState extends State<ProfileElements> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: profileElements.length,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Column(
            children: [
              Text(
                profileElements[index],
                style: TextStyle(
                    fontFamily: sans,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color:
                      index == selectedIndex ? activeColor : inactiveColor
                    ),
                  ),
                  const SizedBox(
                  height: 4,
                  ),
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: index == selectedIndex ? Colors.black : null,
                      shape: BoxShape.circle
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}

class SocialIconContainer extends StatelessWidget {
  final String iconName;
  const SocialIconContainer({
    super.key,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: logoContainerColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: 16,
            width: 16,
            child: SvgPicture.asset(
              'assets/icons/$iconName',
            ),
          ),
        )
      ],
    );
  }
}
