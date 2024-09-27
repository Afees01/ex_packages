import 'package:ex_packages/view/carousel_screen/carousel_screen.dart';
import 'package:ex_packages/view/image_oicker_screen/image_picker_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImagePickerScreen(),
    );
  }
}
