import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  bool _isClicked = false;
  bool _isFirstTime = false;
  bool _isExpanded = true;
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _heightAnimation =
        Tween<double>(begin: 2000.0, end: 450.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  void _onContainerClick() {
    setState(() {
      _isClicked = !_isClicked;
      _isFirstTime = true;
      if (_isExpanded) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      _isExpanded = !_isExpanded;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 320,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: StatsCard(),
              ),
            ],
          ),
          AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return SizedBox(
                  height: _heightAnimation.value,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Image(
                        height: _heightAnimation.value,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: const NetworkImage(
                            'https://wallpapers.com/images/featured/female-model-pictures-ay167v9wfkn45yl2.jpg'),
                      ),
                      Container(
                        height: _heightAnimation.value,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black,
                              Colors.transparent,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Positioned(
            left: 30,
            top: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInLeft(
                  child: Text(
                    'Mathilda Moran',
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                FadeInLeft(
                    child: Text(
                  'Professional Model',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60),
                ))
              ],
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  const SizedBox(
                    height: kToolbarHeight - 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Icon(
                          Iconsax.save_2,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: height / 10 + 20,
                  right: 30,
                  child: BounceInDown(
                      animate: true,
                      delay: const Duration(milliseconds: 600),
                      duration: const Duration(milliseconds: 300),
                      child: StatItem(number: '205', label: 'Posts')),
                ),
                Positioned(
                  top: height / 10 + 100,
                  right: 30,
                  child: BounceInDown(
                      animate: true,
                      delay: const Duration(milliseconds: 400),
                      duration: const Duration(milliseconds: 300),
                      child: StatItem(number: '145K', label: 'Followers')),
                ),
                Positioned(
                  top: height / 10 + 185,
                  right: 30,
                  child: BounceInDown(
                      animate: true,
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 300),
                      child: StatItem(number: '342', label: 'Following')),
                ),
                Positioned(
                  top: height / 10 + 460,
                  right: 30,
                  child: _isClicked
                      ? FadeInDown(
                          animate: _isClicked,
                          delay: const Duration(milliseconds: 400),
                          duration: const Duration(milliseconds: 200),
                          child: _buildButton(
                            color: Color(0xff703dfb),
                            icon: Icons.email,
                            text: 'Email',
                            onTap: () {
                              print('Email');
                            },
                          ),
                        )
                      : _isFirstTime
                          ? FadeOutUp(
                              animate: true,
                              delay: const Duration(milliseconds: 200),
                              duration: const Duration(milliseconds: 200),
                              child: _buildButton(
                                color: Color(0xff703dfb),
                                icon: Icons.email,
                                text: 'Email',
                                onTap: () {
                                  print('Email');
                                },
                              ),
                            )
                          : Container(),
                ),
                Positioned(
                  top: height / 10 + 380,
                  right: 30,
                  child: _isClicked
                      ? FadeInDown(
                          animate: _isClicked,
                          delay: const Duration(milliseconds: 300),
                          duration: const Duration(milliseconds: 200),
                          child: _buildButton(
                            color: Color(0xffe90039),
                            icon: Icons.call,
                            text: 'Call',
                            onTap: () {
                              print('Call');
                            },
                          ),
                        )
                      : _isFirstTime
                          ? FadeOutUp(
                              animate: true,
                              delay: const Duration(milliseconds: 300),
                              duration: const Duration(milliseconds: 200),
                              child: _buildButton(
                                color: Color(0xffe90039),
                                icon: Icons.call,
                                text: 'Call',
                                onTap: () {
                                  print('Call');
                                },
                              ),
                            )
                          : Container(),
                ),
                Positioned(
                    top: height / 10 + 300,
                    right: 30,
                    child: _isClicked
                        ? FadeInDown(
                            animate: _isClicked,
                            from: 50,
                            delay: const Duration(milliseconds: 200),
                            duration: const Duration(milliseconds: 200),
                            child: _buildButton(
                              color: Color(0xfffeb908),
                              icon: Icons.chat,
                              text: 'Chat',
                              onTap: () {
                                print('Chat');
                              },
                            ),
                          )
                        : _isFirstTime
                            ? FadeOutUp(
                                animate: true,
                                from: 0,
                                delay: const Duration(milliseconds: 400),
                                duration: const Duration(milliseconds: 200),
                                child: _buildButton(
                                  color: Color(0xfffeb908),
                                  icon: Icons.chat,
                                  text: 'Chat',
                                  onTap: () {
                                    print('Chat');
                                  },
                                ),
                              )
                            : Container()),
                Positioned(
                  top: height / 10 + 265,
                  right: 50,
                  child: GestureDetector(
                    onTap: _onContainerClick,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      width: _isClicked ? 60 : 65,
                      height: _isClicked ? 60 : 65,
                      decoration: BoxDecoration(
                        color: _isClicked ? Colors.white : Color(0xfffeb908),
                        borderRadius:
                            BorderRadius.circular(_isClicked ? 100 : 20),
                      ),
                      child: Center(
                        child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 350),
                            transitionBuilder: (child, anim) =>
                                RotationTransition(
                                  turns: child.key == const ValueKey('icon1')
                                      ? Tween<double>(begin: 1, end: 0.75)
                                          .animate(anim)
                                      : Tween<double>(begin: 0.75, end: 1)
                                          .animate(anim),
                                  child: ScaleTransition(
                                      scale: anim, child: child),
                                ),
                            child: _isClicked
                                ? const Icon(Icons.close,
                                    key: ValueKey('icon1'))
                                : const Icon(
                                    color: Colors.white,
                                    Icons.more_horiz,
                                    key: ValueKey('icon2'),
                                  )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required Color color,
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        width: 100,
        padding: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 10),
              Text(text, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String number;
  final String label;

  const StatItem({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 100,
      width: 100,
      color: label == "Posts"
          ? Colors.black38
          : label == "Followers"
              ? Colors.black45
              : Colors.black54,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Stats',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              StatRow(label: 'Followers', value: '11.5K', change: '+22.8%'),
              const SizedBox(height: 5),
              StatRow(label: 'Likes', value: '38.2K', change: '+15.2%'),
              const SizedBox(height: 5),
              StatRow(label: 'Comments', value: '17.8K', change: '+24.5%'),
              SizedBox(height: 10),
            ],
          ),
          Container(
            color: Colors.yellow,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Conversion',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.whatshot,
                      color: Colors.white,
                      size: 32,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '4.65%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StatRow extends StatelessWidget {
  final String label;
  final String value;
  final String change;

  StatRow({required this.label, required this.value, required this.change});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Text(
          change,
          style: const TextStyle(
            color: Colors.greenAccent,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
