import 'package:flutter/material.dart';
import '../widgets/animated_section.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: Colors.grey.shade100,
      child: Column(
        children: [
          const Text(
            "A Little About Me",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _imageCard("assets/images/me1.jpg", 0),
              _imageCard("assets/images/mypic2.jpg", 150),
              _imageCard("assets/images/picone.jpg", 300),
            ],
          ),
        ],
      ),
    );
  }

  Widget _imageCard(String path, int delay) {
    return AnimatedSection(
      delay: Duration(milliseconds: delay),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        height: 260,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.25)),
          ],
        ),
      ),
    );
  }
}
