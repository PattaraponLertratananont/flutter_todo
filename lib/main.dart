import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/screens/home/home.dart';
import 'package:todo/screens/home/home_controller.dart';
import 'package:todo/screens/new_todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.kanit().fontFamily,
      ),
      initialRoute: "/home",
      getPages: [
        GetPage(
            name: "/home",
            page: () => HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(HomeController());
            })),
        GetPage(name: "/new_todo", page: () => NewTodoScreen())
      ],
    );
  }
}
