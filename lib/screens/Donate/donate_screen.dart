import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakt/Utils/colors.dart';

import '../../cutom_nav_bar.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
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
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Container(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 20, top: 10, bottom: 20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                color: appColors.primaryColor)),
                      ],
                    ),
                    const Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Colors.transparent,
                          size: 30,
                        ),
                        Positioned(
                          top: -2,
                          right: -2,
                          child: CircleAvatar(
                            radius: 6,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Emergency',
                      style: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: appColors.primaryTextColor)),
                  const SizedBox(width: 5),
                  Text('SEE ALL',
                      style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: appColors.secondaryTextColor))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.red,
                    width: 1,
                  ),
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.red[100]!],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Color(0xffC5C5C5)),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    'AB+',
                                    style: GoogleFonts.manrope(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Positioned(
                                    top: 0,
                                    right: 0,
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/rakt.png'))))
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.warning, color: Colors.grey),
                                  SizedBox(width: 5),
                                  Text(
                                    'Heart Surgery',
                                    style: GoogleFonts.manrope(
                                      color: appColors.tertiaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(Icons.local_hospital,
                                      color: Colors.grey),
                                  const SizedBox(width: 5),
                                  Text(
                                    'City Hospital, New Delhi',
                                    style: GoogleFonts.manrope(
                                      color: appColors.tertiaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_month,
                                      color: Colors.grey),
                                  SizedBox(width: 5),
                                  Text(
                                    'April 20, 2024',
                                    style: GoogleFonts.manrope(
                                      color: appColors.tertiaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle donate now action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'DONATE NOW',
                            style: GoogleFonts.manrope(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Nearby Seeker',
                      style: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: appColors.primaryTextColor)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6, // You can set the number of items dynamically
                itemBuilder: (context, index) {
                  return Card(
                    surfaceTintColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.black, width: 1.0),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Color(0xffC5C5C5),
                                width: 1.0,
                              ),
                            ),
                            height: 70,
                            width: 70.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: const Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://www.shutterstock.com/image-vector/medical-concept-hospital-building-doctor-260nw-588196298.jpg'),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'City Hospital, New Delhi',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  '5 Kms Away',
                                  style: GoogleFonts.manrope(
                                    color: appColors.secondaryTextColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.0,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  'Directions',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                    color: appColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
