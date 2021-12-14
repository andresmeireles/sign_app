import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sign_draw_app/features/sign_gallery/sign_gallery.dart';
import 'package:sign_draw_app/features/sign_gallery/view/widgets/grid_images_view.dart';

class SignGalleryPage extends StatelessWidget {
  const SignGalleryPage({Key? key}) : super(key: key);

  Widget _bloc(List<FileSystemEntity> images) {
    return BlocProvider(
      create: (_) => SignGalleryBloc(images),
      child: _SignGalleryView(),
    );
  }

  Future<List<FileSystemEntity>> _getImagesFromDisk() async {
    final path = (await getApplicationDocumentsDirectory()).path;
    final imageDirectory = '$path/img/';

    return Directory(imageDirectory).listSync();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FileSystemEntity>>(
      future: _getImagesFromDisk(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.hasData && snapshot.data != null) {
          return _bloc(snapshot.data!);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class _SignGalleryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignGalleryBloc>();
    final state = context.select((SignGalleryBloc bloc) => bloc.state);

    remove(String path) {
      bloc.add(DeleteSignEvent(path));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('signature list'),
      ),
      body: GridImagesView(
        images: state.images,
        removeImage: remove,
      ),
    );
  }
}
