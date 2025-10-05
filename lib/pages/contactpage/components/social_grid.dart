import 'package:flutter/material.dart';
import 'package:fortpolio/pages/contactpage/components/social_link.dart';
import 'model.dart';

class SocialsGrid extends StatelessWidget {
  const SocialsGrid({super.key, required this.socials});
  final List<Social> socials;

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
      itemBuilder: (_, i) => SocialLink(social: socials[i]),
    );
  }
}