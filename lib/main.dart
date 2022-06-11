import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyLoginWidget()));
}

class MyLoginWidget extends StatefulWidget {
  const MyLoginWidget({Key? key}) : super(key: key);

  @override
  State<MyLoginWidget> createState() => _MyLoginWidgetState();
}

class _MyLoginWidgetState extends State<MyLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
