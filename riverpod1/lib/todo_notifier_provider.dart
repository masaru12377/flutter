import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoNotifierProvider =
    NotifierProvider<TodoNotifier, List<Todo>>(TodoNotifier.new);

class TodoNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() {
    return [Todo(id: '1', title: '昼寝する')];
  }

  void add(String title) {
    print("todo追加始まり");

    for (int i = 0; i < 3; i++) {
      final todo = Todo(id: Random().nextDouble().toString(), title: title);
      if (kDebugMode) {
        print("$i番目のtodo追加");
      }
      state=[...state,todo];
    }
    if (kDebugMode) {
      print("todo追加終わり");
    }
  }

  void remove(Todo todo){
    state = state.where((item)=>item.id != todo.id).toList();
  }

  void toggle(Todo todo){
    state = state.map((item){
      if(item.id == todo.id) item.copyWith(completed: !item.completed);
      return item;
    }).toList();
  }
}

class Todo {
  String id;
  String title;
  bool completed;
  Todo({required this.id, required this.title,this.completed = false});


  void copyWith({required completed}){
    this.completed = completed;
  }

}
