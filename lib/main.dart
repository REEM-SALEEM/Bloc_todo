import 'package:bloc_todo/cubit/todo_cubit.dart';
import 'package:bloc_todo/pages/add_todo_page.dart';
import 'package:bloc_todo/pages/todo_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const ToDoListPage(),
          '/add-todo': (_) => const AddTodoPage(),
        },
      ),
    );
  }
}
