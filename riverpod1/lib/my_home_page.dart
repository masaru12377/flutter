import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod1/todo_notifier_provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoNotifierProvider);
    final todoNotifier = ref.read(todoNotifierProvider.notifier);
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("sample"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    maxLength: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    todoNotifier.add(controller.text);
                  },
                  icon: const Icon(Icons.play_arrow),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text("TODO"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: ((BuildContext context, int index) {
                  final todo = todoList[index];
                  return Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Checkbox(
                              value: todo.completed,
                              onChanged: (value) => todoNotifier.toggle(todo),
                            ),
                            Text(
                              todo.title,
                              style: TextStyle(
                                color:
                                    todo.completed ? Colors.grey : Colors.black,
                                decoration: todo.completed
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () => todoNotifier.remove(todo),
                          icon: const Icon(Icons.delete)),
                    ],
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
