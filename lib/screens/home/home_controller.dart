import 'package:get/get.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/service/mock_todo.dart';

class HomeController extends GetxController {
  @override
  onInit() {
    super.onInit();
    setTodo();
  }

  RxList<Todo> _todos = RxList<Todo>([]);

  List<Todo> get todos => this._todos;
  set todos(List<Todo> value) => this._todos.value = [...value];

  Future<void> setTodo() async {
    final _todos = await MockTodo.getTodo();
    todos = _todos;
  }

  Future<void> deleteTodo(index) async {
    await MockTodo.deleteTodo(index);
    await setTodo();
  }

  Future<void> completeTodo(index) async {
    await MockTodo.completeTodo(index);
    await setTodo();
  }
}
