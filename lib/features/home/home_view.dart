import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sign app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('form'),
              child: const Text('cadastro'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('draw'),
              child: const Text('draw sign'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('gallery'),
              child: const Text('sign gallery'),
            ),
          ],
        ),
      ),
    );
  }
}
