import 'package:flutter/material.dart';
import 'package:todo/screens/new_todo.dart';
import 'package:todo/widgets/title_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      actionName: "new",
                      action: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NewTodoScreen(),
                          ),
                        );
                      },
                    ),
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.check_circle_outline_rounded),
                            title: Text(
                              "อ่านหนังสือก่อนนอน",
                            ),
                            subtitle: Text(
                              "เล่ม นอนอย่างมีประสิทธิภาพ",
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                          );
                        },
                      ),
                    ),
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
