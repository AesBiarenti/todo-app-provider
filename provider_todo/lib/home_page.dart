import 'package:bolum_30_provider_todo/provider/providers.dart';
import 'package:bolum_30_provider_todo/widgets/listview.dart';
import 'package:bolum_30_provider_todo/widgets/mission_text.dart';
import 'package:bolum_30_provider_todo/widgets/textfield.dart';
import 'package:bolum_30_provider_todo/widgets/tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

var currentFilter = TodoFilter.all;
Color changeColor(TodoFilter filt) {
  return currentFilter == filt ? Colors.deepPurple.shade400 : Colors.white;
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    currentFilter = ref.watch(filtertodolist);
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO PROVİDER"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFields(),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GorevText(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonsWidget(
                      text: "Tüm Görevler",
                      color: changeColor(TodoFilter.all),
                      onTap: () {
                        ref.read(filtertodolist.notifier).state =
                            TodoFilter.all;
                      },
                    ),
                    const SizedBox(width: 5),
                    ButtonsWidget(
                      text: "Tamamlanmıs",
                      color: changeColor(TodoFilter.completed),
                      onTap: () {
                        ref.read(filtertodolist.notifier).state =
                            TodoFilter.completed;
                      },
                    ),
                    const SizedBox(width: 5),
                    ButtonsWidget(
                      text: "Kalan Görevler",
                      color: changeColor(TodoFilter.active),
                      onTap: () {
                        ref.read(filtertodolist.notifier).state =
                            TodoFilter.active;
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          const ListViews()
        ],
      ),
    );
  }
}
