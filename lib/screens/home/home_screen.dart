import 'package:flutter/material.dart';
import '../../sections/hero_section.dart';
import '../../sections/about_section.dart';
import '../../sections/gallery_section.dart';
import '../../sections/skills_section.dart';
import '../../sections/contact_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            HeroSection(),
            AboutSection(),
            GallerySection(),
            SkillsSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
