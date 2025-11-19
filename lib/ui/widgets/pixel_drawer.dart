import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routing/app_routes.dart';
import '../theme/pixel_theme.dart';

class PixelDrawer extends StatelessWidget {
  const PixelDrawer({super.key, required this.currentRoute});

  final String currentRoute;

  List<_NavItem> get _items => const [
        _NavItem('Home', AppRoutes.home),
        _NavItem('Services', AppRoutes.services),
        _NavItem('Programming & Security', AppRoutes.programmingSecurity),
        _NavItem('Printing', AppRoutes.printing),
        _NavItem('VPN', AppRoutes.vpn),
        _NavItem('Repairs', AppRoutes.repair),
        _NavItem('Gamification', AppRoutes.gamification),
        _NavItem('About', AppRoutes.about),
        _NavItem('Contact', AppRoutes.contact),
        _NavItem('FAQ', AppRoutes.faq),
      ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: PixelTheme.surfaceDark,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Arian Digital',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Pixel services hub',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          for (final item in _items)
            ListTile(
              title: Text(item.label),
              trailing:
                  currentRoute == item.route ? const Icon(Icons.play_arrow) : null,
              onTap: () {
                context.go(item.route);
                Navigator.of(context).maybePop();
              },
            ),
        ],
      ),
    );
  }
}

class _NavItem {
  final String label;
  final String route;
  const _NavItem(this.label, this.route);
}
