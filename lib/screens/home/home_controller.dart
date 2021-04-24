import 'package:get/get.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/service/mock_todo.dart';

class HomeController extends GetxController {
  RxList<Todo> _todos = RxList<Todo>([]);

  List<Todo> get todos => this._todos;
  set todos(value) => this._todos.value = value;

  Future<void> setTodo() async {
    final _todos = await MockTodo.getTodo();
    todos = _todos;
  }
}
