import 'package:flutter/material.dart';

class PortraitCard extends StatelessWidget {
  const PortraitCard({super.key, this.height});

  final double? height;

  @override
  Widget build(BuildContext context) {
    // Soft peach background like the reference
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Your portrait; keep some padding to mimic the composition
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Image.asset(
                  'assets/profile/profile.jpg', // <-- replace with your asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
