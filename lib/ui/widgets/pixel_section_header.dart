import 'package:flutter/material.dart';

import '../theme/pixel_theme.dart';

class PixelSectionHeader extends StatelessWidget {
  const PixelSectionHeader(this.title, {super.key, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: PixelTheme.neonLime, width: 2),
            color: PixelTheme.neonLime.withOpacity(0.08),
          ),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ],
    );
  }
}
