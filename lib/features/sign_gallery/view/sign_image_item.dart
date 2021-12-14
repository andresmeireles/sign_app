import 'dart:io';

import 'package:flutter/material.dart';

class SignImageItem extends StatelessWidget {
  final String path;

  const SignImageItem({required this.path, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('sign'),),
      body: Center(
        child: Container(
          color: Colors.greenAccent,
          child: Image.file(File(path)),
        ),
      ),
    );
  }
}
