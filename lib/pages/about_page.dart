import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
          child: SingleChildScrollView(
            child: Container(
              height: 500,
              width: 1000,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Title
                  Text(
                    "About Me",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 6, bottom: 40),
                    height: 3,
                    width: 80,
                    color: const Color(0xFF00E5FF),
                  ),

                  /// Bio text
                  Text(
                    "I’m Roshan Lal Yogi, a passionate Flutter developer who loves building apps that are not only functional but also beautifully crafted. My focus is on creating modern, responsive, and fluid user experiences with clean architecture and robust performance.",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      height: 1.8,
                      color: Colors.grey[300],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "With experience in tools like Supabase, Hive, and Isar, and backend technologies like Python and FastAPI, I aim to grow as a full-stack developer. I take pride in writing clean code, constantly learning, and pushing my creativity into real-world applications.",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      height: 1.8,
                      color: Colors.grey[300],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 60),

                  /// Closing Line
                  Text(
                    "\"Turning ideas into code, and code into experiences.\"",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[400],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
