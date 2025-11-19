import 'package:flutter/material.dart';

import '../../routing/app_routes.dart';
import '../widgets/pixel_card.dart';
import '../widgets/pixel_page_shell.dart';
import '../widgets/pixel_section_header.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelPageShell(
      currentRoute: AppRoutes.about,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PixelSectionHeader('About Arian Digital Services'),
          const SizedBox(height: 24),
          Text(
            'Born from a collective of programmers, print engineers, and arcade lovers, Arian Digital Services is a studio that blends craft with defense.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final bool stacked = constraints.maxWidth < 900;
              return Flex(
                direction: stacked ? Axis.vertical : Axis.horizontal,
                children: const [
                  Expanded(
                    child: PixelCard(
                      title: 'Vision',
                      description: 'A neon future',
                      icon: Icons.visibility,
                      child: Text(
                        'Make technology services feel like a trusted co-op campaign where creativity, safety, and play coexist.',
                      ),
                    ),
                  ),
                  SizedBox(width: 20, height: 20),
                  Expanded(
                    child: PixelCard(
                      title: 'Mission',
                      description: 'Deliver measurable impact',
                      icon: Icons.bolt,
                      child: Text(
                        'Ship reliable solutions—from code to printers to VPN nodes—that clients can operate confidently on day one.',
                      ),
                    ),
                  ),
                  SizedBox(width: 20, height: 20),
                  Expanded(
                    child: PixelCard(
                      title: 'Values',
                      description: 'What drives us',
                      icon: Icons.favorite,
                      child: Text(
                        'Security-first • Transparent pricing • Constant iteration • Radical support.',
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
