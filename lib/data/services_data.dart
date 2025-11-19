import 'package:flutter/material.dart';

import '../models/service_info.dart';
import '../routing/app_routes.dart';

/// Predefined services to render throughout the app.
final List<ServiceInfo> mainServices = [
  ServiceInfo(
    title: 'Programming & Security',
    description:
        'Secure coding, penetration testing, and network hardening for modern infrastructures.',
    icon: Icons.shield_rounded,
    route: AppRoutes.programmingSecurity,
    highlights: [
      'Penetration testing engagements',
      'Secure SDLC coaching',
      'Firewall & SOC automation',
    ],
  ),
  ServiceInfo(
    title: 'Printing',
    description: 'Business cards, posters, merchandising, and high-volume document runs.',
    icon: Icons.print_rounded,
    route: AppRoutes.printing,
    highlights: [
      'Brand-safe colors',
      'Same-day local pickup',
      'Bulk discounts',
    ],
  ),
  ServiceInfo(
    title: 'VPN',
    description: 'Encrypted tunnels with multi-device support and simple dashboards.',
    icon: Icons.vpn_lock_rounded,
    route: AppRoutes.vpn,
    highlights: [
      'Zero-log commitment',
      'High-availability gateways',
      'Admin-friendly portal',
    ],
  ),
  ServiceInfo(
    title: 'Repairs',
    description: 'Diagnostics, repairs, and tune-ups for desktops, laptops, and mobile.',
    icon: Icons.build_circle_rounded,
    route: AppRoutes.repair,
    highlights: [
      'Same-week turnarounds',
      'Certified technicians',
      'Data backup safety',
    ],
  ),
  ServiceInfo(
    title: 'Gamification',
    description: 'Customer loyalty quests, point engines, and themed community events.',
    icon: Icons.sports_esports,
    route: AppRoutes.gamification,
    highlights: [
      'Quest designer toolkit',
      'Live leaderboards',
      'Reward marketplace',
    ],
  ),
];
