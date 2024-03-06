import 'package:bolum_30_provider_todo/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListTiles extends ConsumerStatefulWidget {
  const ListTiles({super.key});
  @override
  ConsumerState<ListTiles> createState() => _ListTilesState();
}

class _ListTilesState extends ConsumerState<ListTiles> {
  late FocusNode focus;
  late TextEditingController _controller;
  bool _isfocus = false;
  @override
  void initState() {
    super.initState();
    focus = FocusNode();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    focus.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTodoitem = ref.watch(currentTodo);
    return Focus(
      onFocusChange: (value) {
        if (!value) {
          setState(() {
            _isfocus = false;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.deepPurple.shade300,
          child: ListTile(
            onTap: () {
              setState(() {
                _isfocus = true;
                focus.requestFocus();
                _controller.text = currentTodoitem.text;
              });
            },
            leading: Checkbox(
              value: currentTodoitem.isChecked,
              onChanged: (value) => ref
                  .watch(todoListProvider.notifier)
                  .toogle(currentTodoitem.id),
              activeColor: Colors.deepPurple.shade300,
              shape: const CircleBorder(),
              checkColor: Colors.deepPurple.shade100,
            ),
            title: _isfocus
                ? TextField(
                    controller: _controller,
                    focusNode: focus,
                    onSubmitted: (value) {
                      ref.watch(todoListProvider.notifier).editTodo(
                          id: currentTodoitem.id, aciklama: _controller.text);
                    },
                  )
                : Text(currentTodoitem.text),
          ),
        ),
      ),
    );
  }
}
