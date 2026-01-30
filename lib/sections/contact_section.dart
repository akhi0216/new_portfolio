import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/animated_section.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0EA69F), Color(0xFF22D3EE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: AnimatedSection(
        child: Column(
          children: [
            const Text(
              "Let’s Build Something Together",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              "Have a project idea, need a Flutter developer,\n"
              "or want help planning your product?",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 50),

            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                _contactCard(
                  icon: Icons.email,
                  label: "Email Me",
                  value: "akhilaam20022@gmail.com",
                  url: "mailto:akhilaam20022@gmail.com",
                ),
                _contactCard(
                  icon: Icons.work_outline,
                  label: "LinkedIn",
                  value: "View Profile",
                  url: "https://www.linkedin.com/in/akhila-m-a434b0299/",
                ),
                _contactCard(
                  icon: Icons.camera_alt_outlined,
                  label: "Instagram",
                  value: "@akhilaah_m",
                  url: "https://www.instagram.com/akhilaah_m/",
                ),
              ],
            ),

            const SizedBox(height: 60),
            const Text(
              "Available for freelance & long-term projects",
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactCard({
    required IconData icon,
    required String label,
    required String value,
    required String url,
  }) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Container(
        width: 260,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(blurRadius: 30, color: Colors.black.withOpacity(0.25)),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: const Color(0xFF0EA69F)),
            const SizedBox(height: 14),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 6),
            Text(value, style: const TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
