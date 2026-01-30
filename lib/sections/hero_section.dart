import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/animated_section.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _bgController;

  @override
  void initState() {
    super.initState();
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 16),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _bgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 750,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: _bgController,
        builder: (_, __) {
          return Stack(
            children: [
              // 🌈 ANIMATED GRADIENT BACKGROUND
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.lerp(
                          const Color(0xFF0F766E),
                          const Color(0xFF0EA69F),
                          _bgController.value,
                        )!,
                        Color.lerp(
                          const Color(0xFF042F2E),
                          const Color(0xFF164E63),
                          1 - _bgController.value,
                        )!,
                      ],
                    ),
                  ),
                ),
              ),

              // ✨ SOFT LIGHT GLOW (SUBTLE)
              Positioned.fill(
                child: Opacity(
                  opacity: 0.25,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment.topCenter,
                        radius: 0.8,
                        colors: [Colors.white, Colors.transparent],
                      ),
                    ),
                  ),
                ),
              ),

              // ✨ FLOATING GLOW DOTS (AMBIENT MOTION)
              ...List.generate(6, (index) {
                final random = Random(index);
                return Positioned(
                  top: random.nextDouble() * 700,
                  left: random.nextDouble() * MediaQuery.of(context).size.width,
                  child: AnimatedOpacity(
                    opacity: _bgController.value,
                    duration: const Duration(seconds: 4),
                    child: Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.35),
                      ),
                    ),
                  ),
                );
              }),

              // 🌟 MAIN CONTENT
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // IMAGE STACK
                      AnimatedSection(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            _profileImage("assets/images/picone.jpg", 170, -10),
                            _profileImage("assets/images/picone.jpg", 220, 0),
                            _profileImage("assets/images/picone.jpg", 170, 10),
                          ],
                        ),
                      ),

                      const SizedBox(height: 44),

                      // NAME
                      AnimatedSection(
                        delay: const Duration(milliseconds: 200),
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.92, end: 1),
                          duration: const Duration(milliseconds: 700),
                          builder: (_, scale, child) =>
                              Transform.scale(scale: scale, child: child),
                          child: const Text(
                            "Akhila M",
                            style: TextStyle(
                              fontSize: 46,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.3,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // ROLE
                      AnimatedSection(
                        delay: const Duration(milliseconds: 350),
                        child: const Text(
                          "Product Developer • Planner • Flutter Specialist",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                        ),
                      ),

                      const SizedBox(height: 22),

                      // TAGLINE
                      AnimatedSection(
                        delay: const Duration(milliseconds: 520),
                        child: const Text(
                          "I design, plan and build beautiful\nmobile & web experiences.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ),

                      const SizedBox(height: 46),

                      // CTA
                      AnimatedSection(
                        delay: const Duration(milliseconds: 700),
                        child: _ctaButton(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /* ---------------- COMPONENTS ---------------- */

  Widget _profileImage(String path, double size, double rotation) {
    return Transform.rotate(
      angle: rotation * pi / 180,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              blurRadius: 35,
              offset: const Offset(0, 12),
              color: Colors.black.withOpacity(0.35),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ctaButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          colors: [Color(0xFF22D3EE), Color(0xFF0EA69F)],
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            offset: const Offset(0, 10),
            color: Colors.black.withOpacity(0.35),
          ),
        ],
      ),
      child: const Text(
        "Scroll to Explore ↓",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}
