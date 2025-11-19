import 'package:flutter/material.dart';

import '../../routing/app_routes.dart';
import '../widgets/pixel_page_shell.dart';
import '../widgets/pixel_section_header.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      const _FaqItem(
        question: 'Do you support international clients?',
        answer:
            'Yes. We remotely deliver programming, VPN, and gamification work; printing and repairs can be coordinated via logistics partners.',
      ),
      const _FaqItem(
        question: 'Can services be bundled?',
        answer: 'Absolutely. Many customers pair penetration testing with VPN deployments and loyalty programs.',
      ),
      const _FaqItem(
        question: 'How fast is support?',
        answer: 'Critical issues get responses in under 1 hour during working days. We run on-call rotations for urgent tickets.',
      ),
    ];

    return PixelPageShell(
      currentRoute: AppRoutes.faq,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PixelSectionHeader('Frequently Asked Questions'),
          const SizedBox(height: 24),
          ...faqs,
        ],
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  final String question;
  final String answer;
  const _FaqItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        collapsedShape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white24, width: 2),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white24, width: 2),
        ),
        title: Text(question.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium),
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(answer),
          ),
        ],
      ),
    );
  }
}
