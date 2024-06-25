import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakt/Utils/colors.dart';

class DonorTile extends StatelessWidget {
  final String name;
  final String location;
  final String imageUrl;

  DonorTile({
    required this.name,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfHc7y8Xqsn-0MpB7QnbfNzJ9GJL2JdwIJbI7syEuVPxEqInk4gMc719gC7TPmkr5ewm4&usqp=CAU')),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  color: appColors.primaryTextColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                location,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: appColors.secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {
            // Handle button press
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: appColors.tertiaryColor,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'View Details',
            style: GoogleFonts.manrope(
              fontSize: 14,
              color: appColors.primaryTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
