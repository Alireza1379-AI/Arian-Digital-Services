import 'package:flutter/material.dart';

import '../../routing/app_routes.dart';
import '../widgets/pixel_button.dart';
import '../widgets/pixel_card.dart';
import '../widgets/pixel_page_shell.dart';
import '../widgets/pixel_section_header.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PixelPageShell(
      currentRoute: AppRoutes.contact,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PixelSectionHeader('Contact Us',
              subtitle: 'Send a briefing and we will respond within one business day.'),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final bool stacked = constraints.maxWidth < 900;
              return Flex(
                direction: stacked ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: PixelCard(
                      title: 'Message Control',
                      description: 'Ready for your mission details',
                      icon: Icons.message,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(labelText: 'Name'),
                              validator: (value) =>
                                  value == null || value.isEmpty ? 'Enter your name' : null,
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(labelText: 'Email'),
                              validator: (value) =>
                                  value != null && value.contains('@') ? null : 'Valid email required',
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _subjectController,
                              decoration: const InputDecoration(labelText: 'Subject'),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _messageController,
                              decoration: const InputDecoration(labelText: 'Message'),
                              maxLines: 5,
                            ),
                            const SizedBox(height: 16),
                            PixelButton(
                              label: 'Send Brief',
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Transmission ready — connect backend to deliver.'),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: stacked ? 0 : 20, height: stacked ? 20 : 0),
                  Expanded(
                    child: PixelCard(
                      title: 'HQ Coordinates',
                      description: 'Arian Digital Services',
                      icon: Icons.location_on,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          _InfoRow('Location', 'Kabul, Afghanistan (serving remotely worldwide)'),
                          _InfoRow('Hours', 'Sun-Thu 9:00-18:00 • Fri emergency support'),
                          _InfoRow('Email', 'ops@arian.digital'),
                          _InfoRow('Phone', '+93 700 00 00 00'),
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

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(), style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 4),
          Text(value),
        ],
      ),
    );
  }
}
