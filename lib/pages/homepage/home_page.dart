import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/underline.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// Top-left Name
          Positioned(
            top: 20,
            left: 20,
            child: Row(
              children: [
                Text(
                  "Roshan",
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 26,
                    color: Colors.green,
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  "lalyogi",
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 26,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),

          /// Email vertically in middle left
          Positioned(
            left: 20,
            top: 150,
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                "yogiroshan2005@gmail.com",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  letterSpacing: 2,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),

          Positioned(
            right: 20,
            top: 20,
            child: Text(
              "LET'S TALK",
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.white,
                letterSpacing: 0,
              ),
            ),
          ),

          /// Center Quote
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Turning ideas \ninto code and code into",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 70,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),

                /// Experiences with underline + star
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "experiences.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 70,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                    ),

                    /// Underline
                    Positioned(
                      bottom: -8,
                      child: CustomPaint(
                        size: const Size(400, 20),
                        painter: CurvedUnderlinePainter(),
                      ),
                    ),

                    /// Star
                    Positioned(
                      right: -50,
                      bottom: -5,
                      child: Icon(
                        Icons.star_border_rounded,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Bottom-left Arrow + Scroll text
          Positioned(
            left: 40,
            bottom: 40,
            child: Column(
              children: [
                Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                  size: 28,
                ),
                const SizedBox(height: 8),
                Text(
                  "Scroll to explore",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    letterSpacing: 2,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),

          /// Social Icons - bottom-right
          Positioned(
            right: 20,
            bottom: 50,
            child: Column(
              children: [
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(height: 5),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.white,
                    size: 20,
                  ),
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