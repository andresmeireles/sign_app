import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sign_draw_app/features/draw/bloc/sign_bloc.dart';
import 'package:signature/signature.dart';

class DrawView extends StatelessWidget {
  const DrawView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignBloc(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignBloc>();
    final controller = bloc.state.controller;

    save() async {
      bloc.add(Save());
      // wait until bloc update
      await Future.delayed(const Duration(seconds: 1));
      final s = bloc.state;
      if (s.status == Status.success) {
        Fluttertoast.showToast(msg: s.message);
        Navigator.of(context).pop();
      }
      if (s.status == Status.fail) {
        Fluttertoast.showToast(msg: s.message);
        print('deu ruim');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('draw your sign'),
      ),
      body: Column(
        children: [
          Signature(
            controller: controller,
            height: 250,
            width: 250,
            backgroundColor: Colors.greenAccent,
          ),
          ElevatedButton(
            onPressed: () => context.read<SignBloc>().add(Clear()),
            child: Text('limpar'),
          ),
          ElevatedButton(
            onPressed: save,
            child: Text('salvar'),
          ),
        ],
      ),
    );
  }
}
