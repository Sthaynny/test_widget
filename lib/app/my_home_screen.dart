import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({Key key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final ValueNotifier<bool> stateButton = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<bool>(
          valueListenable: stateButton,
          builder: (context, bool value, child) {
            return CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                stateButton.value = !stateButton.value;
              },
              child: Icon(
                value ? Icons.favorite : Icons.favorite_border,
                size: value ? 88 : 42,
                color: value ? Colors.pink : Colors.pink[200],
              ),
            );
          },
        ),
      ),
    );
  }
}
