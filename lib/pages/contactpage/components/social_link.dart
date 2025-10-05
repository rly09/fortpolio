import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'model.dart';

class SocialLink extends StatefulWidget {
  const SocialLink({super.key, required this.social});
  final Social social;

  @override
  State<SocialLink> createState() => _SocialLinkState();
}

class _SocialLinkState extends State<SocialLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final base = GoogleFonts.inter(
      color: Colors.white.withOpacity(0.9),
      fontWeight: FontWeight.w600,
      letterSpacing: 0.2,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.social.url), mode: LaunchMode.externalApplication),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: _hover ? Colors.white : Colors.white24,
                shape: BoxShape.circle,
              ),
            ),
            Text(
              widget.social.label,
              style: base.copyWith(
                color: _hover ? Colors.white : Colors.white70,
                decoration: _hover ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}