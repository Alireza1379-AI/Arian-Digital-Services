import 'package:flutter/material.dart';

import '../../routing/app_routes.dart';
import '../widgets/pixel_card.dart';
import '../widgets/pixel_page_shell.dart';
import '../widgets/pixel_section_header.dart';

class RepairPage extends StatelessWidget {
  const RepairPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelPageShell(
      currentRoute: AppRoutes.repair,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PixelSectionHeader('Device Repair Lab'),
          const SizedBox(height: 24),
          Text(
            'Diagnostics, soldering, and software triage happen under one neon roof. We treat every device like it holds a galaxy.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: const [
              _RepairCard(
                title: 'Workstations & Servers',
                bullets: [
                  'Thermal repaste, PSU swaps, and board-level repairs',
                  'OS hardening and data center burn-in tests',
                  'Data backup & imaging before every fix',
                ],
              ),
              _RepairCard(
                title: 'Laptops & Tablets',
                bullets: [
                  'Screen, hinge, and keyboard replacements',
                  'Battery health refresh and calibration',
                  'OS clean installs with security baseline',
                ],
              ),
              _RepairCard(
                title: 'Phones & Consoles',
                bullets: [
                  'Board-level micro soldering',
                  'Controller drift correction',
                  'Water damage revival protocols',
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RepairCard extends StatelessWidget {
  const _RepairCard({required this.title, required this.bullets});

  final String title;
  final List<String> bullets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: PixelCard(
        title: title,
        description: 'Lab-certified care',
        icon: Icons.build,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: bullets
              .map(
                (bullet) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text('▶ $bullet'),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
