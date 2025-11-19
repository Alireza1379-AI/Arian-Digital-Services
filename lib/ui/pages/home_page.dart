import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/services_data.dart';
import '../../routing/app_routes.dart';
import '../widgets/pixel_button.dart';
import '../widgets/pixel_card.dart';
import '../widgets/pixel_page_shell.dart';
import '../widgets/pixel_section_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelPageShell(
      currentRoute: AppRoutes.home,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HeroSection(),
          const SizedBox(height: 60),
          const PixelSectionHeader('Core Services',
              subtitle: 'Engineered with a blend of code, creativity, and care.'),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 1100
                  ? 3
                  : constraints.maxWidth > 700
                      ? 2
                      : 1;
              return GridView.builder(
                itemCount: mainServices.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final service = mainServices[index];
                  return PixelCard(
                    title: service.title,
                    description: service.description,
                    icon: service.icon,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: service.highlights
                          .map((h) => Chip(
                                label: Text(h),
                                backgroundColor: Colors.white.withOpacity(0.05),
                              ))
                          .toList(),
                    ),
                    badge: IconButton(
                      onPressed: () => context.go(service.route),
                      icon: const Icon(Icons.open_in_new),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 60),
          const PixelSectionHeader('Why Arian Digital?'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: const [
              _ReasonChip('Pixel-perfect web craftsmanship'),
              _ReasonChip('Security-first mindset for every service'),
              _ReasonChip('Neon-fast support response times'),
              _ReasonChip('Future-ready gamification platform'),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool vertical = constraints.maxWidth < 900;
        final heroContent = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ARIAN DIGITAL SERVICES',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 16),
            Text(
              'Programming, printing, VPN, repairs, and gamification in one neon-hardened cockpit.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
                PixelButton(
                  label: 'View Services',
                  icon: Icons.grid_view,
                  onPressed: () => context.go(AppRoutes.services),
                ),
                PixelButton(
                  label: 'Get in Touch',
                  isPrimary: false,
                  icon: Icons.mail_outline,
                  onPressed: () => context.go(AppRoutes.contact),
                ),
              ],
            ),
          ],
        );

        final questCard = const _QuestCard();

        return Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF091520), Color(0xFF1B0240)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: Colors.white24, width: 2),
          ),
          child: vertical
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heroContent,
                    const SizedBox(height: 24),
                    questCard,
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: heroContent),
                    const SizedBox(width: 40),
                    Expanded(child: questCard),
                  ],
                ),
        );
      },
    );
  }
}

class _QuestCard extends StatelessWidget {
  const _QuestCard();

  @override
  Widget build(BuildContext context) {
    return PixelCard(
      title: 'Daily Quest',
      description:
          'Complete two services this month and unlock neon loyalty perks with double points.',
      icon: Icons.auto_awesome,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearProgressIndicator(
            value: 0.65,
            minHeight: 10,
            backgroundColor: Colors.white12,
            color: Colors.purpleAccent,
          ),
          const SizedBox(height: 12),
          Text(
            'Progress: 65% - Keep going, operative!'
                .toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}

class _ReasonChip extends StatelessWidget {
  final String label;
  const _ReasonChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.white.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: const BorderSide(color: Colors.white24, width: 2),
      ),
    );
  }
}
