import 'package:flutter/material.dart';
// import 'package:harvest_hero/screens/home_screen.dart';
import 'package:harvest_hero/screens/model_screen.dart';
// import 'dart:math' as math;
  

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}


class _NavigationState extends State<Navigation> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: getFloatingButton(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: const [
        ModelScreen(),
        // FeedScreen(),
        Center(
          child: Text("Upload"),
        ),
        // MembersScreen(),
        // ProfileScreen(),
      ],
    );
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 20,
              offset: const Offset(0, 1)),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 0;
                });
              },
              child: Icon(
                Icons.home,
                size:30,
                color: activeTab == 0 ? Colors.green : Colors.black,
              ),
            ),
            const SizedBox(
              width: 55,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 1;
                });
              },
              child: Icon(
                Icons.amp_stories,
                size:30,
                color: activeTab == 1 ? Colors.green : Colors.black,
              ),
            ),
        //     Row(
        //       children: [
        //         GestureDetector(
        //           onTap: () {
        //             setState(() {
        //               activeTab = 3;
        //             });
        //           },
        //           child: Icon(
        //             Icons.groups,
        //             size: 25,
        //             color: activeTab == 3 ? Colors.blue : Colors.black,
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 55,
        //         ),
        //         GestureDetector(
        //           onTap: () {
        //             setState(() {
        //               activeTab = 4;
        //             });
        //           },
        //           child: Icon(
        //             Icons.account_circle,
        //             size: 28,
        //             color: activeTab == 4 ? Colors.blue : Colors.black,
        //           ),
        //         ),
        //       ],
        //     )
          ],
        ),
      ),
    );
  }
}
//   Widget getFloatingButton() {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           activeTab = 2;
//         });
//       },
//       child: Transform.rotate(
//         angle: -math.pi / 4,
//         child: Container(
//           width: 60,
//           height: 60,
//           decoration: BoxDecoration(boxShadow: [
//             BoxShadow(
//                 color: Colors.grey.withOpacity(0.3),
//                 spreadRadius: 2,
//                 blurRadius: 15,
//                 offset: const Offset(0, 1)),
//           ], color: Colors.black, borderRadius: BorderRadius.circular(23)),
//           child: Transform.rotate(
//             angle: -math.pi / 4,
//             child: const Center(
//                 child: Icon(
//               Icons.add_circle_outline_outlined,
//               color: Colors.white,
//               size: 26,
//             )),
//           ),
//         ),
//       ),
//     );
//   }
// }
