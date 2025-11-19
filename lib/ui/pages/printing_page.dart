import 'package:flutter/material.dart';

import '../../routing/app_routes.dart';
import '../widgets/pixel_card.dart';
import '../widgets/pixel_page_shell.dart';
import '../widgets/pixel_section_header.dart';

class PrintingPage extends StatelessWidget {
  const PrintingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelPageShell(
      currentRoute: AppRoutes.printing,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PixelSectionHeader('Printing Services'),
          const SizedBox(height: 24),
          Text(
            'From single-page rush jobs to thousands of brand assets, our presses stay calibrated for neon-level precision.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: const [
              _PrintingCard(
                title: 'Business Essentials',
                details: [
                  'Business cards with spot UV and metallic foils',
                  'Letterheads and presentation decks',
                  'Presentation folders and internal assets',
                ],
              ),
              _PrintingCard(
                title: 'Large Format',
                details: [
                  'Posters and roll-up banners',
                  'Window clings and decals',
                  'Event-ready backdrop walls',
                ],
              ),
              _PrintingCard(
                title: 'Bulk & Logistics',
                details: [
                  'Inventory tracking for recurring orders',
                  'Climate-controlled storage',
                  'Same-day or next-day delivery partners',
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PrintingCard extends StatelessWidget {
  const _PrintingCard({required this.title, required this.details});

  final String title;
  final List<String> details;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: PixelCard(
        title: title,
        description: 'Precision printing',
        icon: Icons.print,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: details
              .map(
                (detail) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text('• $detail'),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
