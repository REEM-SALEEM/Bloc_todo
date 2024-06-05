import 'package:bloc_todo/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  @override
  Widget build(BuildContext context) {
    final todoTitleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add To-Do'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: todoTitleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  context.read<TodoCubit>().addTodo(
                        todoTitleController.text.trim(),
                      );
                  // Navigator.pop(context);
                },
                child: const Text('Add'))
          ],
        ),
      ),
    );
  }
}
