import 'package:bloc_todo/cubit/todo_cubit.dart';
import 'package:bloc_todo/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoListPage extends StatelessWidget {
  const ToDoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<TodoCubit, List<Todo>>(
              builder: (context, todos) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return Container(
                      color: Colors.yellow,
                      child: ListTile(
                          title: Text("Name --> ${todo.name}"),
                          subtitle: Text(
                              "Date --> ${todo.createdAt.toString().split(' ')[0]}")),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
