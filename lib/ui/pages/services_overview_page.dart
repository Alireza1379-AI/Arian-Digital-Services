import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/services_data.dart';
import '../../routing/app_routes.dart';
import '../widgets/pixel_button.dart';
import '../widgets/pixel_card.dart';
import '../widgets/pixel_page_shell.dart';
import '../widgets/pixel_section_header.dart';

class ServicesOverviewPage extends StatelessWidget {
  const ServicesOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelPageShell(
      currentRoute: AppRoutes.services,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PixelSectionHeader('Services Overview',
              subtitle: 'One cockpit, multiple neon-grade services.'),
          const SizedBox(height: 24),
          ...mainServices.map(
            (service) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: PixelCard(
                title: service.title,
                description: service.description,
                icon: service.icon,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: service.highlights
                          .map((h) => Chip(
                                label: Text(h),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 12),
                    PixelButton(
                      label: 'Dive Deeper',
                      onPressed: () => context.go(service.route),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
