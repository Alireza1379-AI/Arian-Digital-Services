import 'package:flutter/material.dart';

import '../../routing/app_routes.dart';
import '../widgets/pixel_card.dart';
import '../widgets/pixel_page_shell.dart';
import '../widgets/pixel_section_header.dart';

class GamificationPage extends StatelessWidget {
  const GamificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelPageShell(
      currentRoute: AppRoutes.gamification,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PixelSectionHeader('Gamification Layer'),
          const SizedBox(height: 24),
          Text(
            'We turn service interactions into missions, streaks, and leaderboards. Loyalty becomes a playful system.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final bool stacked = constraints.maxWidth < 900;
              return Flex(
                direction: stacked ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: PixelCard(
                      title: 'Mechanics',
                      description: 'What players experience',
                      icon: Icons.auto_awesome_mosaic,
                      child: _BulletList(
                        items: [
                          'Points & tiers for every invoice or ticket',
                          'Streak rewards for consistent engagement',
                          'Collaborative quests for teams and families',
                          'Surprise drops triggered by milestones',
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20, height: 20),
                  Expanded(
                    child: PixelCard(
                      title: 'Quest Blueprint',
                      description: 'Sample mission layout',
                      icon: Icons.flag_circle,
                      child: _QuestBlueprint(),
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
  const _BulletList({required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text('★ $item'),
            ),
          )
          .toList(),
    );
  }
}

class _QuestBlueprint extends StatelessWidget {
  const _QuestBlueprint();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _QuestRow('Mission', 'Upgrade two laptops this week'),
        _QuestRow('Rewards', '+400 XP, +1 neon badge, VIP chat'),
        _QuestRow('Bonus', 'Complete printing order for 2x multiplier'),
        const SizedBox(height: 12),
        LinearProgressIndicator(
          value: 0.3,
          backgroundColor: Colors.white12,
          color: Colors.pinkAccent,
        ),
        const SizedBox(height: 8),
        Text(
          '30% Completed - Keep the streak alive'.toUpperCase(),
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}

class _QuestRow extends StatelessWidget {
  final String label;
  final String value;
  const _QuestRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label.toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white24, width: 2),
              ),
              child: Text(value),
            ),
          ),
        ],
      ),
    );
  }
}
