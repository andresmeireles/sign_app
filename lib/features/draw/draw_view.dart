import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sign_draw_app/core/widget/button/can_disable_elevated_button.dart';
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

class _View extends StatefulWidget {
  const _View({Key? key}) : super(key: key);

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  var _disable = false;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignBloc>();
    final controller = bloc.state.controller;
    final media = MediaQuery.of(context);
    final multiply = media.orientation == Orientation.portrait ? 0.85 : 0.8;
    final screen = media.size;
    final width = screen.width;
    final height = (screen.height * multiply) - AppBar().preferredSize.height;

    save() async {
      setState(() => _disable = true);
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
      }
      setState(() => _disable = false);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('draw your sign'),
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          children: [
            Signature(
              controller: controller,
              height: height,
              width: width,
              backgroundColor: Colors.white,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => bloc.add(Clear()),
                    child: Text('limpar'),
                  ),
                  CanDisableElevatedButton(
                    disable: _disable,
                    onPressed: save,
                    child: const Text('salvar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
