import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routing/app_routes.dart';
import '../theme/pixel_theme.dart';
import 'pixel_button.dart';

class ArianNavbar extends StatelessWidget implements PreferredSizeWidget {
  const ArianNavbar({
    super.key,
    required this.currentRoute,
    required this.isCompact,
  });

  final String currentRoute;
  final bool isCompact;

  List<_NavItem> get _items => const [
        _NavItem('Home', AppRoutes.home),
        _NavItem('Services', AppRoutes.services),
        _NavItem('Security', AppRoutes.programmingSecurity),
        _NavItem('Printing', AppRoutes.printing),
        _NavItem('VPN', AppRoutes.vpn),
        _NavItem('Repair', AppRoutes.repair),
        _NavItem('Gamify', AppRoutes.gamification),
        _NavItem('About', AppRoutes.about),
        _NavItem('Contact', AppRoutes.contact),
        _NavItem('FAQ', AppRoutes.faq),
      ];

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    if (isCompact) {
      return AppBar(
        backgroundColor: PixelTheme.surfaceDark,
        title: const Text('Arian Digital Services'),
        centerTitle: false,
        automaticallyImplyLeading: true,
      );
    }

    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: PixelTheme.surfaceDark,
        border: Border(bottom: BorderSide(color: PixelTheme.borderDark, width: 2)),
        boxShadow: const [
          BoxShadow(color: Colors.black54, offset: Offset(0, 4)),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          Text(
            'Arian Digital',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          for (final item in _items)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: PixelButton(
                label: item.label,
                isPrimary: currentRoute == item.route,
                onPressed: () => context.go(item.route),
              ),
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
