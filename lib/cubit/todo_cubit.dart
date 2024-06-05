import 'package:bloc_todo/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError('Title cannot be empty!');
      return;
    }
    final todo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );

    // shouldn't be used all the time as state should be modifiable only through emit() function
    // since List is a mutable class, we were able to modify the values within it.
    // state.add(todo); --> *current state

    /* emit(state); --> doesn't work properly as :-
    suppose current state becomes [1,2], hence
    if current state == emit state then no change will occur (doesn't notify listener)
    ---> [emit] does nothing if the [state] being emitted is equal to the current [state].<--- */

    // gets each of the elements of new list that we created.
    // previous list + new todo.
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('error --> $error');
  }
}
