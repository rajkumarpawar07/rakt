import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakt/Utils/colors.dart';
import 'package:rakt/screens/Chat/chat_screen.dart';
import 'package:rakt/screens/Donate/donate_screen.dart';
import 'package:rakt/screens/MapDonor/map_donor_screen.dart';
import 'package:rakt/screens/Profile/profile_screen.dart';
import 'package:rakt/screens/Receive/receive_screen.dart';
import 'package:rakt/screens/TestScreens/animation_screen.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildReceiveScreen(BuildContext context) {
    return Center(
      child: Text('Receive Screen'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      ReceiveScreen(),
      const DonateScreen(),
      const MapDonorScreen(),
    ];

    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          _screens[_selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomBottomNavigationBar(
                selectedIndex: _selectedIndex,
                onItemTapped: _onItemTapped,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      height: 75,
      decoration: BoxDecoration(
        color: Color(0xffDE0A1E),
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem(
            svgSrc: 'assets/svgs/receive.svg',
            isIcon: false,
            icon: Icons.input,
            label: 'Receive',
            index: 0,
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
          ),
          NavBarItem(
            isIcon: false,
            svgSrc: 'assets/svgs/donate.svg',
            icon: Icons.favorite,
            label: 'Donate',
            index: 1,
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
          ),
          NavBarItem(
            icon: Icons.chat,
            label: 'Chat',
            index: 2,
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final bool? isIcon;
  final String? svgSrc;
  final String label;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  NavBarItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onItemTapped,
    this.isIcon = true,
    this.svgSrc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        height: 65,
        width: 75,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? const Color(0xFFEC999B)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isIcon!
                ? Icon(
                    icon,
                    color:
                        selectedIndex == index ? Colors.white : Colors.white70,
                  )
                : SvgPicture.asset(
                    svgSrc!,
                    color:
                        selectedIndex == index ? Colors.white : Colors.white70,
                  ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: selectedIndex == index ? Colors.white : Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Hero(
                      tag: 'ProfileImage',
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL5NU3Y8TbsAC65WqvrXHuUGD1jmCHEsVnvAl9zPuEcQ&s', // Replace with your profile image URL
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Vikas Saini',
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'username',
                          style: GoogleFonts.manrope(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle navigation
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileScreen()));
                          },
                          child: Text(
                            'View Profile',
                            style: GoogleFonts.manrope(
                              decorationThickness: 2,
                              decorationColor: appColors.primaryColor,
                              color: appColors.primaryColor,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.local_hospital),
                title: Text(
                  'Hospitals & Blood Banks',
                  style: GoogleFonts.manrope(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  // Handle navigation
                },
              ),
              Divider(
                color: Color(0xffC4C4C4),
                indent: 50,
                endIndent: 30,
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text(
                  'Refer a Friend',
                  style: GoogleFonts.manrope(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  // Handle navigation
                },
              ),
              Divider(
                color: Color(0xffC4C4C4),
                indent: 50,
                endIndent: 30,
              ),
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text(
                  'Feedback',
                  style: GoogleFonts.manrope(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  // Handle navigation
                },
              ),
              Divider(
                color: Color(0xffC4C4C4),
                indent: 50,
                endIndent: 30,
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  'About Us',
                  style: GoogleFonts.manrope(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  // Handle navigation
                },
              ),
              Divider(
                color: Color(0xffC4C4C4),
                indent: 50,
                endIndent: 30,
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip),
                title: Text(
                  'Privacy Policy',
                  style: GoogleFonts.manrope(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  // Handle navigation
                },
              ),
              Divider(
                color: Color(0xffC4C4C4),
                indent: 50,
                endIndent: 30,
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text(
                  'Rate Us',
                  style: GoogleFonts.manrope(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  // Handle navigation
                },
              ),
              Divider(
                color: Color(0xffC4C4C4),
                indent: 50,
                endIndent: 30,
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: GoogleFonts.manrope(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  // Handle navigation
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AnimationScreen();
                  }));
                },
              ),
            ],
          ),
          Positioned(
            top: kToolbarHeight - 20,
            right: 10,
            child: IconButton(
              icon: Icon(
                Icons.close,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
