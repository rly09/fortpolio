import 'package:flutter/material.dart';
import 'package:fortpolio/pages/aboutpage/about_page.dart';
import 'package:fortpolio/pages/homepage/home_page.dart';
import 'package:fortpolio/pages/projectpage/project_page.dart';
import 'package:fortpolio/pages/skillpage/skill_page.dart';

class PortfolioPageview extends StatefulWidget {
  const PortfolioPageview({super.key});

  @override
  State<PortfolioPageview> createState() => _PortfolioPageviewState();
}

class _PortfolioPageviewState extends State<PortfolioPageview> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: [HomePage(), AboutPage(), ProjectPage(), SkillPage()],
      ),
    );
  }
}
