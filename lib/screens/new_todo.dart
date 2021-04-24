import 'package:flutter/material.dart';
import 'package:todo/widgets/title_bar.dart';

class NewTodoScreen extends StatefulWidget {
  NewTodoScreen({Key? key}) : super(key: key);

  @override
  _NewTodoScreenState createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  TextEditingController topicController = TextEditingController();
  TextEditingController todoController = TextEditingController();
  FocusNode topicFocusNode = FocusNode();
  FocusNode todoFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/cover.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.7,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                    children: [
                      titleBar(
                        actionName: "save",
                        action: () {
                          print(topicController.text);
                          print(todoController.text);
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: TextField(
                          controller: topicController,
                          focusNode: topicFocusNode,
                          cursorColor: Colors.grey.shade600,
                          decoration: InputDecoration(
                            labelText: "Topic",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.grey.shade600,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller: todoController,
                          focusNode: todoFocusNode,
                          cursorColor: Colors.grey.shade600,
                          maxLines: 8,
                          decoration: InputDecoration(
                            labelText: "Todo...",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.grey.shade600,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top,
                child: Container(
                  padding: EdgeInsets.only(left: 16, top: 8),
                  child: IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
