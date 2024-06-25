import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakt/Utils/colors.dart';
import 'package:rakt/screens/Receive/widgets/donor_tile.dart';

import '../../cutom_nav_bar.dart';

class ReceiveScreen extends StatefulWidget {
  const ReceiveScreen({super.key});

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  String? _selectedNeed;
  String? _selectedBloodGroup;
  String? _selectedBookingOption;

  final List<String> _needs = ['Blood', 'Plasma', 'Platelets'];

  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  final List<Map<String, String>> donors = [
    {
      'name': 'Nitish Kumar Boro',
      'location': 'Shastri Nagar, Delhi',
      'image': 'https://example.com/image.jpg', // replace with actual image URL
    },
    {
      'name': 'Nitish Kumar Boro',
      'location': 'Shastri Nagar, Delhi',
      'image': 'https://example.com/image.jpg', // replace with actual image URL
    },
    {
      'name': 'Nitish Kumar Boro',
      'location': 'Shastri Nagar, Delhi',
      'image': 'https://example.com/image.jpg', // replace with actual image URL
    },
    {
      'name': 'Nitish Kumar Boro',
      'location': 'Shastri Nagar, Delhi',
      'image': 'https://example.com/image.jpg', // replace with actual image URL
    },
    // Add more donors if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                transform: GradientRotation(-0.3),
                colors: [
                  Color(0xFFEC999B),
                  Color(0xFFfcefef),
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.9, 1],
              ),
            ),
          ),
          _buildReceiveScreen(context),
        ],
      ),
    );
  }

  Widget _buildReceiveScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          _buildCustomAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('What you want to receive?',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    )),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: appColors.primaryColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: appColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 0,
                    ),
                  ),
                  value: _selectedNeed,
                  items: _needs.map((String need) {
                    return DropdownMenuItem<String>(
                      value: need,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                        child: Text(
                          need,
                          style: GoogleFonts.manrope(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    '-- Select Your Need --',
                    style: GoogleFonts.manrope(
                      color: appColors.secondaryTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedNeed = newValue;
                    });
                  },
                  icon: const Center(
                    child: Icon(Icons.arrow_drop_down,
                        color: appColors.primaryColor),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Choose your Blood Group',
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                GridView.count(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    _buildBloodGroupButton('O+'),
                    _buildBloodGroupButton('A+'),
                    _buildBloodGroupButton('B+'),
                    _buildBloodGroupButton('AB+'),
                    _buildBloodGroupButton('O-'),
                    _buildBloodGroupButton('A-'),
                    _buildBloodGroupButton('B-'),
                    _buildBloodGroupButton('AB-'),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Select Your Need',
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildBookingOption('Book Now'),
                    _buildBookingOption('Book for Later'),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: appColors.primaryColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(
                        'Find Donor',
                        style: GoogleFonts.manrope(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Available Donors',
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: donors.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: appColors.tertiaryColor,
                    thickness: 1,
                  ),
                  itemBuilder: (context, index) {
                    return DonorTile(
                      name: donors[index]['name']!,
                      location: donors[index]['location']!,
                      imageUrl: donors[index]['image']!,
                    );
                  },
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomAppBar() {
    return Container(
      padding:
          const EdgeInsets.only(left: 10.0, right: 20, top: 10, bottom: 20.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: appColors.primaryColor,
              size: 30,
            ),
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(height: 50, 'assets/images/rakt.png'),
              Text('RAKT',
                  style: GoogleFonts.manrope(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFFDE0A1E))),
            ],
          ),
          InkWell(
            onTap: () {
              // Handle notification tap
            },
            child: const Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.notifications,
                  color: Color(0xFFDE0A1E),
                  size: 30,
                ),
                Positioned(
                  top: -2,
                  right: -2,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBloodGroupButton(String bloodGroup) {
    bool isSelected = _selectedBloodGroup == bloodGroup;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBloodGroup = bloodGroup;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? appColors.primaryColor : Colors.white,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          bloodGroup,
          style: GoogleFonts.manrope(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildBookingOption(String option) {
    return Flexible(
      child: RadioListTile<String>(
        contentPadding: EdgeInsets.zero,
        title: Text(
          option,
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        value: option,
        groupValue: _selectedBookingOption,
        onChanged: (String? value) {
          setState(() {
            _selectedBookingOption = value;
          });
        },
        activeColor: appColors.primaryColor,
      ),
    );
  }
}

// class CustomBottomNavigationBar extends StatelessWidget {
//   final int selectedIndex;
//   final ValueChanged<int> onItemTapped;
//
//   CustomBottomNavigationBar({
//     required this.selectedIndex,
//     required this.onItemTapped,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       padding: EdgeInsets.all(5),
//       height: 75,
//       decoration: BoxDecoration(
//         color: Color(0xffDE0A1E),
//         borderRadius: BorderRadius.circular(100),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 10,
//             spreadRadius: 1,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           NavBarItem(
//             svgSrc: 'assets/svgs/receive.svg',
//             isIcon: false,
//             icon: Icons.input,
//             label: 'Receive',
//             index: 0,
//             selectedIndex: selectedIndex,
//             onItemTapped: onItemTapped,
//           ),
//           NavBarItem(
//             isIcon: false,
//             svgSrc: 'assets/svgs/donate.svg',
//             icon: Icons.favorite,
//             label: 'Donate',
//             index: 1,
//             selectedIndex: selectedIndex,
//             onItemTapped: onItemTapped,
//           ),
//           NavBarItem(
//             icon: Icons.chat,
//             label: 'Chat',
//             index: 2,
//             selectedIndex: selectedIndex,
//             onItemTapped: onItemTapped,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class NavBarItem extends StatelessWidget {
//   final IconData icon;
//   final bool? isIcon;
//   final String? svgSrc;
//   final String label;
//   final int index;
//   final int selectedIndex;
//   final ValueChanged<int> onItemTapped;
//
//   NavBarItem({
//     required this.icon,
//     required this.label,
//     required this.index,
//     required this.selectedIndex,
//     required this.onItemTapped,
//     this.isIcon = true,
//     this.svgSrc,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => onItemTapped(index),
//       child: Container(
//         height: 65,
//         width: 75,
//         decoration: BoxDecoration(
//           color: selectedIndex == index
//               ? const Color(0xFFEC999B)
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             isIcon!
//                 ? Icon(
//                     icon,
//                     color:
//                         selectedIndex == index ? Colors.white : Colors.white70,
//                   )
//                 : SvgPicture.asset(
//                     svgSrc!,
//                     color:
//                         selectedIndex == index ? Colors.white : Colors.white70,
//                   ),
//             const SizedBox(height: 5),
//             Text(
//               label,
//               style: TextStyle(
//                 color: selectedIndex == index ? Colors.white : Colors.white70,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
