import 'package:flutter/widgets.dart';
import '../features/draw/draw.dart';
import '../features/home/home.dart';
import '../features/sign_form/sign_form.dart';
import '../features/sign_gallery/sign_gallery.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> namedRoutes(BuildContext context) {
    return {
      '/': (context) => const HomeView(),
      'draw': (context) => const DrawView(),
      'gallery': (context) => const SignGalleryPage(),
      'form': (context) => const SignFormPage()
    };
  }
}