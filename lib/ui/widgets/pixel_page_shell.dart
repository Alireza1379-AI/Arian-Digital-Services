import 'package:flutter/material.dart';

import '../theme/pixel_theme.dart';
import 'arian_navbar.dart';
import 'pixel_drawer.dart';

/// Shared shell for every page that wires the navigation bar and drawer.
class PixelPageShell extends StatelessWidget {
  const PixelPageShell({
    super.key,
    required this.currentRoute,
    required this.child,
  });

  final String currentRoute;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isCompact = constraints.maxWidth < 1024;
        return Scaffold(
          backgroundColor: PixelTheme.darkBackground,
          appBar: ArianNavbar(currentRoute: currentRoute, isCompact: isCompact),
          drawer: isCompact ? PixelDrawer(currentRoute: currentRoute) : null,
          body: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1400),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isCompact ? 20 : 60,
                    vertical: 40,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
