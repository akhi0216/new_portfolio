import 'package:flutter/material.dart';
import '../widgets/animated_section.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF020617)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const Text(
            "What I Do",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "I blend technology, creativity, and planning to build meaningful products",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 50),

          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: List.generate(_services.length, (index) {
              final service = _services[index];
              return AnimatedSection(
                delay: Duration(milliseconds: index * 150),
                child: _ServiceCard(
                  icon: service.icon,
                  title: service.title,
                  description: service.description,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

/* ---------------- CARD ---------------- */

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.12),
            Colors.white.withOpacity(0.04),
          ],
        ),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(blurRadius: 30, color: Colors.black.withOpacity(0.4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.15),
            ),
            child: Icon(icon, color: Colors.white, size: 26),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(color: Colors.white70, height: 1.4),
          ),
        ],
      ),
    );
  }
}

/* ---------------- DATA ---------------- */

class _Service {
  final IconData icon;
  final String title;
  final String description;

  _Service(this.icon, this.title, this.description);
}

final _services = [
  _Service(
    Icons.phone_iphone,
    "Flutter App Development",
    "Design and build high-quality mobile applications with smooth UI and performance.",
  ),
  _Service(
    Icons.web,
    "Flutter Web Development",
    "Create responsive, modern websites using Flutter Web.",
  ),
  _Service(
    Icons.lightbulb_outline,
    "Product Planning",
    "Transform ideas into structured, scalable digital products.",
  ),
  _Service(
    Icons.palette_outlined,
    "Design & UX",
    "User-focused UI/UX design with attention to detail and aesthetics.",
  ),
  _Service(
    Icons.edit_document,
    "Content & Documentation",
    "Proofreading, writing, documentation, and presentation creation.",
  ),
  _Service(
    Icons.manage_accounts,
    "Project Coordination",
    "Managing tasks, communication, and delivery with clarity.",
  ),
];
