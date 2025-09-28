import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Inspirational Quote
              RichText(
                text: TextSpan(
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.4,
                  ),
                  children: const [
                    TextSpan(
                      text: "Start",
                      style: TextStyle(color: Color(0xFF00E5FF)),
                    ),
                    TextSpan(text: " where you are.\n"),
                    TextSpan(
                      text: "Use",
                      style: TextStyle(color: Color(0xFF00E5FF)),
                    ),
                    TextSpan(text: " what you have.\n"),
                    TextSpan(
                      text: "Do",
                      style: TextStyle(color: Color(0xFF00E5FF)),
                    ),
                    TextSpan(text: " what you can."),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// Author attribution
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "~ Arthur Ashe",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.grey[400],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// First paragraph
              Text(
                "A passionate Flutter developer who believes that the best apps are not just functional—they're beautifully simple, intuitive, and built with purpose. I specialize in creating modern, responsive mobile applications with clean UIs, smooth user experiences, and robust architecture. With a strong foundation in Flutter and experience using tools like Supabase, Isar, and Hive, I enjoy crafting apps that feel fast, fluid, and ready for real-world use. I’m also expanding into backend technologies like Python and FastAPI to become a more complete full-stack app developer.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.grey[300],
                ),
              ),

              const SizedBox(height: 24),

              /// Second paragraph
              Text(
                "Every project I work on is a chance to solve real problems, learn something new, and turn ideas into polished, interactive experiences. I take pride in writing clean code, paying attention to detail, and constantly evolving my skills. When I’m not building apps, I’m usually exploring design trends, leveling up my coding abilities, or diving into new tech that inspires me.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
