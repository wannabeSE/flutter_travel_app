import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/dummy_data.dart';
import 'package:travel_app/constants/fonts_and_colors.dart';
import 'package:travel_app/screens/components/icon_container.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({super.key});

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
                  padding: EdgeInsets.only(left: 32.0),
                  child: IconContainer(iconName: 'arrow_left.svg'),
                ),
                SizedBox(
                  width: 85,
                ),
                Text(
                  'Natural Place',
                  style: TextStyle(
                      fontFamily: sans,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(24, 30, 0, 24),
            //   child: SizedBox(
            //     height: 40,
            //     width: 456,
            //     child:
            //         ListView(scrollDirection: Axis.horizontal, children: const [
            //       CategoryContainer(
            //         width: 88,
            //         text: 'All',
            //       ),
            //       CategoryContainer(width: 126, text: 'Mountain')
            //     ]),
            //     // child: ListView.builder(
            //     //   itemCount: 4,
            //     //   scrollDirection: Axis.horizontal,
            //     //   itemBuilder: (context, index) {
            //     //     return Row(
            //     //       children: [
            //     //         Padding(
            //     //           padding: const EdgeInsets.only(right: 8.0),
            //     //           child: GestureDetector(
            //     //             onTap: () {
            //     //               set
            //     //             },
            //     //             child: Container(
            //     //               height: 40,
            //     //               width: index == 1 ? 126 : 88,
            //     //               decoration: BoxDecoration(
            //     //                   border: Border.all(
            //     //                       width: 1, color: categoryColor),
            //     //                   borderRadius: BorderRadius.circular(16)),
            //     //               child: Row(
            //     //                 mainAxisAlignment: MainAxisAlignment.center,
            //     //                 children: [
            //     //                   SvgPicture.asset(
            //     //                     'assets/icons/menu.svg',
            //     //                     color: categoryColor,
            //     //                   ),
            //     //                   SizedBox(width: 8),
            //     //                   Text(
            //     //                     name[index],
            //     //                     style: TextStyle(
            //     //                         fontFamily: sans,
            //     //                         fontSize: 12,
            //     //                         fontWeight: FontWeight.w400,
            //     //                         color: categoryColor),
            //     //                   )
            //     //                 ],
            //     //               ),
            //     //             ),
            //     //           ),
            //     //         )
            //     //       ],
            //     //     );
            //     //   },
            //     // )
            //   ),
            // )
            Padding(
              padding: EdgeInsets.fromLTRB(24, 30, 0, 24),
              child: ListOfCategoryContainers(),
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
                            color: index == selectedIndex ? Colors.black : categoryColor,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/menu.svg',
                            color: index == selectedIndex ? Colors.white : categoryColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            name[index],
                            style: TextStyle(
                                fontFamily: sans,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: categoryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}

// class CategoryContainer extends StatefulWidget {
//   final double width;
//   final String text;
//   const CategoryContainer({
//     required this.width,
//     required this.text,
//     super.key,
//   });

//   @override
//   State<CategoryContainer> createState() => _CategoryContainerState();
// }

// Color color = categoryColor;
// bool active = false;

// class _CategoryContainerState extends State<CategoryContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           active = !active;
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(right: 8.0),
//         child: Container(
//           height: 40,
//           width: widget.width,
//           decoration: BoxDecoration(
//               border: Border.all(width: 1, color: active ? Colors.black : categoryColor),
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 'assets/icons/menu.svg',
//                 color: color,
//               ),
//               const SizedBox(width: 8),
//               Text(
//                 widget.text,
//                 style: TextStyle(
//                     fontFamily: sans,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                     color: color),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
