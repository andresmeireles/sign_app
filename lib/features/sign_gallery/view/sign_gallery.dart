import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_draw_app/features/sign_gallery/sign_gallery.dart';
import 'package:sign_draw_app/features/sign_gallery/view/widgets/grid_images_view.dart';

class SignGalleryPage extends StatelessWidget {
  const SignGalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignGalleryBloc(),
      child: _SignGalleryView(),
    );
  }
}

class _SignGalleryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final images = context.read<SignGalleryBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text('signature list'),),
      body: FutureBuilder<List<FileSystemEntity>>(
        future: images.state.images,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null) {
              return Text('sem assinaturas');
            }
            if (snapshot.hasData) {
              return GridImagesView(images: snapshot.data!);
            }
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
