import 'package:flutter/material.dart';

/// Basic model describing a single service tile.
class ServiceInfo {
  final String title;
  final String description;
  final IconData icon;
  final String route;
  final List<String> highlights;

  const ServiceInfo({
    required this.title,
    required this.description,
    required this.icon,
    required this.route,
    this.highlights = const [],
  });
}
