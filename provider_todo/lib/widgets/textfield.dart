import 'package:bolum_30_provider_todo/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFields extends ConsumerWidget {
  const TextFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    return TextField(
      controller: controller,
      onSubmitted: (value) {
        ref.read(todoListProvider.notifier).addTodo(value);
        controller.clear();
      },
      decoration: InputDecoration(
        hintText: "Görev Gir",
        hintStyle:
            GoogleFonts.viga(fontWeight: FontWeight.w500, color: Colors.white),
        filled: true,
        fillColor: Colors.deepPurple.shade300,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
