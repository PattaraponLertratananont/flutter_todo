import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/home/home_controller.dart';
import 'package:todo/widgets/title_bar.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/cover.png",
              fit: BoxFit.cover,
              width: Get.width,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: Get.height / 1.7,
                width: Get.width,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  children: [
                    titleBar(
                      actionName: "new",
                      action: () {
                        Get.toNamed("/new_todo")
                            ?.whenComplete(() => controller.setTodo());
                      },
                    ),
                    Obx(
                      () => Container(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: controller.todos.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: controller.todos[index].complete
                                  ? Icon(
                                      Icons.check_circle_outline_rounded,
                                      color: Colors.green,
                                    )
                                  : Icon(
                                      Icons.panorama_fish_eye,
                                      color: Colors.yellow,
                                    ),
                              title: Text(
                                controller.todos[index].topic,
                              ),
                              subtitle: Text(
                                controller.todos[index].msg,
                              ),
                              trailing: PopupMenuButton(
                                icon: Icon(Icons.more_vert),
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      value: "delete",
                                      child: Text("Delete"),
                                    ),
                                  ];
                                },
                                onSelected: (value) {
                                  if (value == "delete") {
                                    controller.deleteTodo(index);
                                  }
                                },
                              ),
                              onTap: () {
                                controller.completeTodo(index);
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
