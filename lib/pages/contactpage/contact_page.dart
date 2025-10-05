import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // Colors to match your Projects page vibe
  static const Color _bg = Color(0xFF0B1020); // deep navy
  static const Color _text = Colors.white;
  static const Color _muted = Color(0xCCFFFFFF);
  static const Color _accent = Color(0xFFFF7A1A); // orange for email/arrow

  // Customize these
  final String _email = 'yogiroshan2005@gmail.com.com';
  final String _addressLine1 = '12/A, 5/A Satmasjid';
  final String _addressLine2 = 'Alexande, VA 238314, Canada';

  final List<_Social> _socials = const [
    _Social('LinkedIn', 'https://www.linkedin.com/in/your-handle'),
    _Social('GitHub', 'https://github.com/your-handle'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: LayoutBuilder(
                builder: (context, c) {
                  final bool isWide = c.maxWidth >= 900;

                  final titleStyle = GoogleFonts.inter(
                    color: _text,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                    height: 1.1,
                    fontSize: isWide ? 56 : 34,
                  );
                  final bigAccent = GoogleFonts.inter(
                    color: _accent,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                    height: 1.1,
                    fontSize: isWide ? 64 : 36,
                    decoration: TextDecoration.underline,
                    decorationColor: _accent,
                    decorationThickness: isWide ? 3 : 2,
                  );
                  final small = GoogleFonts.inter(
                    color: _muted,
                    fontSize: 13,
                    height: 1.6,
                  );

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero block
                      Text('Have a Cool Project idea?', style: titleStyle),
                      const SizedBox(height: 10),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          _EmailLink(
                            email: _email,
                            style: bigAccent,
                            accent: _accent,
                          ),
                          Icon(Icons.arrow_right_alt_rounded,
                              color: _accent, size: isWide ? 42 : 32),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text('for collaborations.', style: titleStyle),
                      const SizedBox(height: 64),

                      // Bottom area: address + socials + policy
                      isWide
                          ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left: Address + privacy
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_addressLine1, style: small),
                                Text(_addressLine2, style: small),
                                const SizedBox(height: 28),
                                _TextLink(
                                  label: 'Privacy Policy',
                                  onTap: () {
                                    // TODO: replace with your policy URL/route
                                    // _launch('https://your-site.com/privacy');
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          // Right: Socials grid
                          Expanded(
                            flex: 8,
                            child: _SocialsGrid(socials: _socials),
                          ),
                        ],
                      )
                          : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_addressLine1, style: small),
                          Text(_addressLine2, style: small),
                          const SizedBox(height: 20),
                          _TextLink(
                            label: 'Privacy Policy',
                            onTap: () {
                              // TODO: replace with your policy URL/route
                              // _launch('https://your-site.com/privacy');
                            },
                          ),
                          const SizedBox(height: 32),
                          _SocialsGrid(socials: _socials),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* ------------ Email link (click = mail, long-press = copy) ------------ */

class _EmailLink extends StatefulWidget {
  const _EmailLink({required this.email, required this.style, required this.accent});
  final String email;
  final TextStyle style;
  final Color accent;

  @override
  State<_EmailLink> createState() => _EmailLinkState();
}

class _EmailLinkState extends State<_EmailLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final s = widget.style.copyWith(
      color: _hover ? widget.accent.withOpacity(0.9) : widget.accent,
      decorationColor: _hover ? widget.accent : widget.accent,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri(
            scheme: 'mailto',
            path: widget.email,
            queryParameters: {'subject': 'Let’s collaborate'},
          );
          await launchUrl(uri);
        },
        onLongPress: () async {
          await Clipboard.setData(ClipboardData(text: widget.email));
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Email copied to clipboard', style: GoogleFonts.inter()),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.black87,
                duration: const Duration(seconds: 1),
              ),
            );
          }
        },
        child: Text(widget.email, style: s),
      ),
    );
  }
}

/* -------------------- Socials -------------------- */

class _Social {
  final String label;
  final String url;
  const _Social(this.label, this.url);
}

class _SocialsGrid extends StatelessWidget {
  const _SocialsGrid({required this.socials});
  final List<_Social> socials;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final is3 = w >= 1000;
    final is2 = w >= 640 && w < 1000;
    final int cols = is3 ? 3 : (is2 ? 2 : 1);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: socials.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cols,
        mainAxisExtent: 44,
        crossAxisSpacing: 24,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (_, i) => _SocialLink(social: socials[i]),
    );
  }
}

class _SocialLink extends StatefulWidget {
  const _SocialLink({required this.social});
  final _Social social;

  @override
  State<_SocialLink> createState() => _SocialLinkState();
}

class _SocialLinkState extends State<_SocialLink> {
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

/* -------------------- Simple text link -------------------- */

class _TextLink extends StatefulWidget {
  const _TextLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_TextLink> createState() => _TextLinkState();
}

class _TextLinkState extends State<_TextLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.inter(
      color: _hover ? Colors.white : Colors.white70,
      fontWeight: FontWeight.w600,
      decoration: _hover ? TextDecoration.underline : TextDecoration.none,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(widget.label, style: style),
      ),
    );
  }
}