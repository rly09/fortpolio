import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fortpolio/pages/about_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _overlayOpacity = 0.4;
  double _scale = 1.0;
  bool _isSidebarOpen = false;

  late AnimationController _controller;
  late Animation<Offset> _sidebarAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _sidebarAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
      if (_isSidebarOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildSidebar() {
    return SlideTransition(
      position: _sidebarAnimation,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 220,
          color: Colors.black87,
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Menu",
                style: GoogleFonts.playfairDisplay(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              _buildMenuItem("About"),
              _buildMenuItem("Skills"),
              _buildMenuItem("Projects"),
              _buildMenuItem("Contact"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutPage()),
          );
          _toggleSidebar();
        },
        child: Text(
          title,
          style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                print("RLY clicked → Go Home");
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  "RLY",
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 16,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: Image.asset("assets/icons/menu.png", height: 30, width: 30),
              onPressed: _toggleSidebar,
            ),
          ),

          /// Sidebar panel
          _buildSidebar(),

          /// Center content with image + overlay text
          Center(
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  _overlayOpacity = 0.2;
                  _scale = 1.05;
                });
              },
              onExit: (_) {
                setState(() {
                  _overlayOpacity = 0.4;
                  _scale = 1.0;
                });
              },
              child: AnimatedScale(
                scale: _scale,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/profile/profile.jpg",
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
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.twitter,
                    color: Colors.white,
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
