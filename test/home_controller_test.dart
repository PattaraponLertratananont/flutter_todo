import 'package:flutter_test/flutter_test.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/screens/home/home_controller.dart';

void main() {
  group("HomeController", () {
    test("set todos", () {
      var controller = new HomeController();
      controller.todos = [
        Todo(
          topic: "Test",
          msg: "Test",
          complete: false,
        )
      ];
      expect(controller.todos.last.topic, "Test");
      expect(controller.todos.last.msg, "Test");
      expect(controller.todos.last.complete, false);
    });
  });
}
