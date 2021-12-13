import 'package:flutter/widgets.dart';
import 'package:sign_draw_app/features/draw/draw.dart';
import 'package:sign_draw_app/features/home/home.dart';
import 'package:sign_draw_app/features/sign_gallery/sign_gallery.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> namedRoutes(BuildContext context) {
    return {
      '/': (context) => const HomeView(),
      'draw': (context) => const DrawView(),
      'gallery': (context) => const SignGalleryPage()
    };
  }
}