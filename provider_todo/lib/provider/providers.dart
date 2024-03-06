import 'package:bolum_30_provider_todo/model/list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

enum TodoFilter { all, active, completed }

final filtertodolist = StateProvider<TodoFilter>((ref) => TodoFilter.all);
////
final todoListProvider =
    StateNotifierProvider<TodoMenager, List<Todo>>((ref) => TodoMenager());
////
final filterProvider = Provider<List<Todo>>(
  (ref) {
    final filter = ref.watch(filtertodolist);
    final todolist = ref.watch(todoListProvider);
    switch (filter) {
      case TodoFilter.all:
        return todolist;
      case TodoFilter.completed:
        return todolist.where((element) => element.isChecked).toList();
      case TodoFilter.active:
        return todolist.where((element) => !(element.isChecked)).toList();
    }
  },
);
////
final tamamlanmamisGorevProvider = Provider<int>((ref) {
  var prov = ref.watch(todoListProvider);
  var sayac = prov.where((element) => !element.isChecked).length;
  return sayac;
});
////
final currentTodo = Provider<Todo>((ref) {
  throw UnimplementedError();
});

////
class TodoMenager extends StateNotifier<List<Todo>> {
  TodoMenager([List<Todo>? todolist]) : super(todolist ?? []);

  void addTodo(String aciklama) {
    Todo eklenecekTodo = Todo(id: const Uuid().v4(), text: aciklama);
    state = [...state, eklenecekTodo];
  }

  void toogle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          Todo(id: todo.id, text: todo.text, isChecked: !(todo.isChecked))
        else
          todo
    ];
  }

  void editTodo({required String id, required String aciklama}) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          Todo(id: todo.id, isChecked: todo.isChecked, text: aciklama)
        else
          todo
    ];
  }

  void removeTodo(Todo silinecekTodo) {
    state = state.where((element) => element.id != silinecekTodo.id).toList();
  }
}
