import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonsWidget extends ConsumerWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  const ButtonsWidget(
      {required this.text,
      required this.onTap,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
