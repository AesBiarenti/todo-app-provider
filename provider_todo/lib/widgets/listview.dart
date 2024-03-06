import 'package:bolum_30_provider_todo/provider/providers.dart';
import 'package:bolum_30_provider_todo/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListViews extends ConsumerWidget {
  const ListViews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todoList = ref.watch(filterProvider);
    return Expanded(
      child: ListView(
        children: [
          for (int i = 0; i < todoList.length; i++)
            Dismissible(
              direction: DismissDirection.startToEnd,
              key: ValueKey(todoList[i].id),
              onDismissed: (direction) {
                ref.read(todoListProvider.notifier).removeTodo(todoList[i]);
              },
              child: ProviderScope(
                overrides: [
                  currentTodo.overrideWithValue(todoList[i]),
                ],
                child: const ListTiles(),
              ),
            ),
        ],
      ),
    );
  }
}
