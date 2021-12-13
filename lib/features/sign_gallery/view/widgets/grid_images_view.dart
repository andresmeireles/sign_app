import 'dart:io';

import 'package:flutter/material.dart';

class GridImagesView extends StatelessWidget {
  final List<FileSystemEntity> images;

  const GridImagesView({required this.images, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: images.map((image) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Image.file(File(image.path)),
        );
      }).toList(),
    );
  }
}
