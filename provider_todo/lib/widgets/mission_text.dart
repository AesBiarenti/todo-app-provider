import 'package:bolum_30_provider_todo/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GorevText extends ConsumerWidget {
  const GorevText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var missionText = ref.watch(tamamlanmamisGorevProvider);

    return Text(
      missionText != 0 ? "$missionText Görev Tamamlanmamıs" : "Hepsi Tamam",
      style: TextStyle(color: Colors.deepPurple.shade500),
    );
  }
}
