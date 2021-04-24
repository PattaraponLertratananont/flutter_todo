import 'package:flutter/material.dart';

Widget titleBar({required String actionName, required Function() action}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Todo",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextButton(
        child: Text(
          actionName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        ),
        onPressed: action,
      ),
    ],
  );
}
