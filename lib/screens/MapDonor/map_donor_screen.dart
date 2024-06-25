import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakt/Utils/colors.dart';

class MapDonorScreen extends StatefulWidget {
  const MapDonorScreen({super.key});

  @override
  State<MapDonorScreen> createState() => _MapDonorScreenState();
}

class _MapDonorScreenState extends State<MapDonorScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.grey, // This represents the map area
        ),
        Positioned(
          top: kToolbarHeight - 10,
          left: 16,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: appColors.tertiaryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Icon(Icons.arrow_back_rounded, size: 30),
            ),
          ),
        ),
        const CustomBottomSheet(), // Custom bottom sheet placed directly in the stack
      ],
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      initialChildSize: 0.4,
      minChildSize: 0.4,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 8),
              GestureDetector(
                onVerticalDragUpdate: (details) {
                  print(details.primaryDelta);
                  // This will allow the drag gesture to be recognized
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Swipe up for more",
                        style: GoogleFonts.manrope(
                            color: const Color(0xffB5B5B5),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  controller: scrollController,
                  itemCount: 10, // Set the number of items dynamically
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      surfaceTintColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                            color: Color(0xffD9D9D9), width: 1.0),
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(
                                  'https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671142.jpg?size=338&ext=jpg&ga=GA1.1.553209589.1715126400&semt=ais'), // Placeholder for image
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Subhadip Mandal',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    '0.9 KM',
                                    style: GoogleFonts.manrope(
                                      color: Color(0xff969696),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xffFF7C11),
                                        size: 16.0,
                                      ),
                                      SizedBox(width: 4.0),
                                      Text(
                                        '5',
                                        style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xffFF7C11),
                                        ),
                                      ),
                                      SizedBox(width: 4.0),
                                      Text(
                                        '(Credit Earned)',
                                        style: GoogleFonts.manrope(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xffFF7C11),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.bloodtype,
                              color: appColors.primaryColor,
                              size: 30.0,
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
        );
      },
    );
  }
}
