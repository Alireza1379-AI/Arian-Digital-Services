import 'package:flutter/material.dart';

import '../../routing/app_routes.dart';
import '../widgets/pixel_card.dart';
import '../widgets/pixel_page_shell.dart';
import '../widgets/pixel_section_header.dart';

class ProgrammingSecurityPage extends StatelessWidget {
  const ProgrammingSecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelPageShell(
      currentRoute: AppRoutes.programmingSecurity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PixelSectionHeader('Programming & Network Security'),
          const SizedBox(height: 24),
          Text(
            'From secure code reviews to SOC-ready infrastructure, we build experiences that are hardened from day zero.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: const [
              _SecurityCard(
                title: 'Penetration Testing',
                items: [
                  'Application & API pentests',
                  'Wireless & IoT assessments',
                  'Executive-ready reports',
                ],
              ),
              _SecurityCard(
                title: 'Secure Coding',
                items: [
                  'Threat modeling workshops',
                  'CI/CD guardrails & SAST',
                  'Developer enablement kits',
                ],
              ),
              _SecurityCard(
                title: 'Network Armor',
                items: [
                  'Firewall deployment & tuning',
                  'Zero Trust network design',
                  'Log enrichment & automation',
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          const PixelSectionHeader('Why security matters'),
          const SizedBox(height: 16),
          const _BulletList(
            bullets: [
              'Customers expect resilience as a default, not an upsell.',
              'Regulators demand verifiable controls and documentation.',
              'Supply chains are under constant threat—secure partners win more deals.',
              'Arian Digital turns compliance tasks into actionable playbooks.',
            ],
          ),
        ],
      ),
    );
  }
}

class _SecurityCard extends StatelessWidget {
  const _SecurityCard({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: PixelCard(
        title: title,
        description: 'Specialized squad',
        icon: Icons.security,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.keyboard_double_arrow_right, size: 16),
                      const SizedBox(width: 8),
                      Expanded(child: Text(item)),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  const _BulletList({required this.bullets});

  final List<String> bullets;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: bullets
          .map(
            (b) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('▮ '),
                  const SizedBox(width: 8),
                  Expanded(child: Text(b)),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
