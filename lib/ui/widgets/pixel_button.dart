import 'package:flutter/material.dart';

import '../theme/pixel_theme.dart';

/// Blocky pixel-styled button with hover/press feedback.
class PixelButton extends StatefulWidget {
  const PixelButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isPrimary = true,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isPrimary;
  final IconData? icon;

  @override
  State<PixelButton> createState() => _PixelButtonState();
}

class _PixelButtonState extends State<PixelButton> {
  bool _hovered = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final Color borderColor = widget.isPrimary
        ? PixelTheme.neonCyan
        : PixelTheme.neonMagenta.withOpacity(0.8);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() {
        _hovered = false;
        _pressed = false;
      }),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) => setState(() => _pressed = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? PixelTheme.neonCyan.withOpacity(0.12)
                : PixelTheme.surfaceDark,
            border: Border.all(
              color: _hovered ? borderColor : borderColor.withOpacity(0.5),
              width: 2,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: borderColor.withOpacity(0.5),
                      blurRadius: 12,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
          transform: Matrix4.identity()
            ..translate(0.0, _pressed ? 3.0 : (_hovered ? -1.5 : 0.0)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  size: 16,
                  color: borderColor,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
