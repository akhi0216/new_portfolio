import 'package:flutter/material.dart';
import 'package:new_portfolio/sections/contact_section.dart';
import '../screens/home/home_screen.dart';

class AppRoutes {
  static const home = '/';
  static const contact = '/contact';

  static final routes = <String, WidgetBuilder>{
    home: (_) => const HomeScreen(),
    contact: (_) => const ContactSection(),
  };
}
