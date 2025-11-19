import 'package:flutter/material.dart';

import '../../routing/app_routes.dart';
import '../widgets/pixel_card.dart';
import '../widgets/pixel_page_shell.dart';
import '../widgets/pixel_section_header.dart';

class VpnPage extends StatelessWidget {
  const VpnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelPageShell(
      currentRoute: AppRoutes.vpn,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PixelSectionHeader('VPN Services'),
          const SizedBox(height: 24),
          Text(
            'Always-encrypted tunnels and multi-device management dashboards keep remote teams productive and protected.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final bool isNarrow = constraints.maxWidth < 700;
              return Flex(
                direction: isNarrow ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: PixelCard(
                      title: 'Capabilities',
                      description: 'What our VPN unlocks',
                      icon: Icons.vpn_lock,
                      child: _BulletList(
                        bullets: [
                          'AES-256 and WireGuard ready nodes',
                          'Dedicated IP pools per client',
                          'Split tunneling for latency-sensitive tools',
                          'Multi-factor admin console with audit logs',
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20, height: 20),
                  Expanded(
                    child: PixelCard(
                      title: 'Use Cases',
                      description: 'Who thrives with our VPN',
                      icon: Icons.router,
                      child: _BulletList(
                        bullets: [
                          'Distributed agencies needing secure staging access',
                          'Manufacturers exposing OT data securely',
                          'Retailers delivering PCI-compliant support desks',
                          'Gamers and creators requiring low-latency peering',
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
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
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text('▢ $b'),
            ),
          )
          .toList(),
    );
  }
}
