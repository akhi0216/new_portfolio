import 'package:flutter/material.dart';
import '../widgets/animated_section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFF8FAFC), Color(0xFFE0F2FE)],
        ),
      ),
      child: AnimatedSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SECTION TITLE
            const Text(
              "About Me",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              "More than just a developer",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),

            const SizedBox(height: 40),

            // MAIN STORY TEXT
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: const Text(
                "I am a Product Developer and Planner with over 2 years of experience "
                "building Flutter mobile applications and websites. I don’t just write code — "
                "I think about users, flow, clarity, and long-term product growth.\n\n"
                "From idea validation and planning to UI/UX design, development, documentation, "
                "and coordination, I enjoy owning the complete journey of a product.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 60),

            // HIGHLIGHT CARDS
            Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: const [
                _HighlightCard(
                  title: "2+ Years",
                  subtitle: "Professional Experience",
                  icon: Icons.timeline,
                ),
                _HighlightCard(
                  title: "Flutter",
                  subtitle: "Mobile & Web Apps",
                  icon: Icons.phone_iphone,
                ),
                _HighlightCard(
                  title: "Product Mindset",
                  subtitle: "Planning → Execution",
                  icon: Icons.lightbulb_outline,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- HIGHLIGHT CARD ---------------- */

class _HighlightCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _HighlightCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white.withOpacity(0.85),
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            offset: const Offset(0, 10),
            color: Colors.black.withOpacity(0.12),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF0EA69F).withOpacity(0.15),
            ),
            child: Icon(icon, color: const Color(0xFF0EA69F), size: 28),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
