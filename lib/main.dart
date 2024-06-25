import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rakt/screens/Chat/chat_screen.dart';
import 'package:rakt/screens/Donate/donate_screen.dart';
import 'package:rakt/screens/Receive/receive_screen.dart';

import 'cutom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // dropdownMenuTheme: const DropdownMenuThemeData(
          //   inputDecorationTheme: InputDecorationTheme(
          //     filled: true,
          //     fillColor: Color(0xffDE0A1E),
          //     focusedBorder: OutlineInputBorder(
          //       borderSide: BorderSide(
          //         color: Color(0xffDE0A1E),
          //       ),
          //     ),
          //     border: OutlineInputBorder(
          //       borderSide: BorderSide(
          //         color: Color(0xffDE0A1E),
          //       ),
          //     ),
          //   ),
          // ),
          // primaryColor: Color(0xFFDE0A1E),
          // inputDecorationTheme: InputDecorationTheme(
          //   border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(8.0),
          //     borderSide: BorderSide(
          //       color: Color(0xFFDE0A1E),
          //     ),
          //   ),
          //   focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(8.0),
          //     borderSide: BorderSide(
          //       color: Color(0xFFDE0A1E),
          //     ),
          //   ),
          //   enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(8.0),
          //     borderSide: BorderSide(
          //       color: Color(0xFFDE0A1E),
          //     ),
          //   ),
          //   contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          // ),
          ),
      home: CustomNavBar(),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   final PageController _pageController = PageController();
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     _pageController.jumpToPage(index);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView(
//             controller: _pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _selectedIndex = index;
//               });
//             },
//             children: const [
//               ReceiveScreen(),
//               DonateScreen(),
//               ChatScreen(),
//             ],
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: CustomBottomNavigationBar(
//                 selectedIndex: _selectedIndex,
//                 onItemTapped: _onItemTapped,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
