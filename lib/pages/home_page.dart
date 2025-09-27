import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _overlayOpacity = 0.4; // default opacity
  double _scale = 1.0; // default scale

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              "RLY", // you can replace with a logo or your initials
              style: GoogleFonts.playfairDisplay(
                fontSize: 16,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          ),
          /// Center content with image + overlay text
          Center(
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  _overlayOpacity = 0.2; // lighter overlay
                  _scale = 1.05; // slight zoom in
                });
              },
              onExit: (_) {
                setState(() {
                  _overlayOpacity = 0.4; // darker overlay
                  _scale = 1.0; // reset zoom
                });
              },
              child: AnimatedScale(
                scale: _scale,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// Profile Image (taller) + overlay
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/profile/profile.jpg", // replace with your image path
                            height: 400,
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 400,
                            width: 300,
                            color: Colors.black.withOpacity(_overlayOpacity),
                          ),
                        ],
                      ),
                    ),

                    /// Name over the image
                    Text(
                      "ROSHAN LAL YOGI",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 50,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Social Icons - right side
          Positioned(
            right: 20,
            bottom: 50,
            child: Column(
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
