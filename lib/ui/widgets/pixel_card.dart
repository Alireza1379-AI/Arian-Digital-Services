import 'package:flutter/material.dart';

import '../theme/pixel_theme.dart';

/// Card with pixel-border decoration used for service highlights.
class PixelCard extends StatelessWidget {
  const PixelCard({
    super.key,
    required this.title,
    required this.description,
    this.icon,
    this.child,
    this.badge,
  });

  final String title;
  final String description;
  final IconData? icon;
  final Widget? child;
  final Widget? badge;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: PixelTheme.surfaceDark,
        border: Border.all(color: PixelTheme.borderDark, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black87,
            offset: Offset(4, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: PixelTheme.neonCyan,
                ),
              if (icon != null) const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title.toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              if (badge != null) badge!,
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (child != null) ...[
            const SizedBox(height: 16),
            child!,
          ],
        ],
      ),
    );
  }
}
