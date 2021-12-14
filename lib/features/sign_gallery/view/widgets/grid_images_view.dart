import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sign_draw_app/features/sign_gallery/view/sign_image_item.dart';

class GridImagesView extends StatelessWidget {
  final List<FileSystemEntity> images;
  final void Function(String) removeImage;

  const GridImagesView({required this.images, required this.removeImage, Key? key}) : super(key: key);

  void navigate(BuildContext context, String path) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SignImageItem(path: path);
    }));
  }

  void _removeSign(BuildContext context, String path) async {
    removeImage(path);
    Navigator.of(context).pop();
  }

  void dialog(BuildContext context, String path) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.file(File(path)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('close'),
                    ),
                    ElevatedButton(
                      onPressed: () => _removeSign(context, path),
                      child: const Text('remove'),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: images.map((image) {
        return GestureDetector(
          onTap: () => dialog(context, image.path),
          onLongPress: () => removeImage(image.path),
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white10,
            child: Container(
              padding: const EdgeInsets.all(4),
              color: Colors.grey,
              child: Image.file(File(image.path)),
            ),
          ),
        );
      }).toList(),
    );
  }
}
