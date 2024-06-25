import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rakt/Utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: appColors.tertiaryColor,
              padding: const EdgeInsets.only(
                  top: 40, left: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded,
                            color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications,
                            size: 30, color: Colors.white),
                        onPressed: () {
                          // Handle notification tap
                        },
                      ),
                    ],
                  ),
                  const Hero(
                    tag: 'ProfileImage',
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL5NU3Y8TbsAC65WqvrXHuUGD1jmCHEsVnvAl9zPuEcQ&s', // Replace with your profile image URL
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Vikash Saini',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Text(
                    'username',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '6',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Credit Earned',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Icon(Icons.bloodtype,
                                color: appColors.primaryColor, size: 30),
                            const SizedBox(height: 4),
                            const Text(
                              'B+ Group',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.favorite,
                                color: appColors.primaryColor, size: 30),
                            const SizedBox(height: 4),
                            const Text(
                              '6 Life Saved',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.calendar_today,
                                color: appColors.primaryColor, size: 30),
                            const SizedBox(height: 4),
                            const Text(
                              '25 March',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Last Donation',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Available to Donate',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value:
                        true, // Change this to a variable if you want to control it dynamically
                    onChanged: (bool value) {
                      // Handle the switch state change
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Recent Posts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671122.jpg'), // Placeholder for post user image
              ),
              title: const Text('Vikas Saini'),
              subtitle: const Text('0.9 KM'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      child: Image.network(
                          'https://www.theemergencycenter.com/wp-content/uploads/2019/01/The-Importance-Of-Blood-Donation.jpeg',
                          fit: BoxFit.cover),
                    ), // Placeholder for post image
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      // Handle like button tap
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.comment),
                    onPressed: () {
                      // Handle comment button tap
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text('Lorem ipsum dolor sit amet consectetur.'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add new post button tap
        },
        child: const Icon(Icons.add),
        backgroundColor: appColors.primaryColor,
      ),
    );
  }
}
