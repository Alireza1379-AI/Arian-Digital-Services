import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/pages/about_page.dart';
import '../ui/pages/contact_page.dart';
import '../ui/pages/gamification_page.dart';
import '../ui/pages/home_page.dart';
import '../ui/pages/printing_page.dart';
import '../ui/pages/programming_security_page.dart';
import '../ui/pages/repair_page.dart';
import '../ui/pages/services_overview_page.dart';
import '../ui/pages/vpn_page.dart';
import '../ui/pages/faq_page.dart';
import 'app_routes.dart';

/// Builds the router with all declared pages.
GoRouter createRouter() {
  return GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.services,
        name: 'services',
        builder: (context, state) => const ServicesOverviewPage(),
      ),
      GoRoute(
        path: AppRoutes.programmingSecurity,
        builder: (context, state) => const ProgrammingSecurityPage(),
      ),
      GoRoute(
        path: AppRoutes.printing,
        builder: (context, state) => const PrintingPage(),
      ),
      GoRoute(
        path: AppRoutes.vpn,
        builder: (context, state) => const VpnPage(),
      ),
      GoRoute(
        path: AppRoutes.repair,
        builder: (context, state) => const RepairPage(),
      ),
      GoRoute(
        path: AppRoutes.gamification,
        builder: (context, state) => const GamificationPage(),
      ),
      GoRoute(
        path: AppRoutes.about,
        builder: (context, state) => const AboutPage(),
      ),
      GoRoute(
        path: AppRoutes.contact,
        builder: (context, state) => const ContactPage(),
      ),
      GoRoute(
        path: AppRoutes.faq,
        builder: (context, state) => const FaqPage(),
      ),
    ],
  );
}
