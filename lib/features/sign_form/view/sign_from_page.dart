import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widget/scaffold/app_scaffold.dart';
import '../sign_form.dart';

class SignFormPage extends StatelessWidget {
  const SignFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignFormBloc(),
      child: _SignFormView(),
    );
  }
}

class _SignFormView extends StatelessWidget {
  final controller = TextEditingController();

  _SignFormView({Key? key}) : super(key: key);

  toSignRoute(BuildContext context, SignFormState state) async {
    final name = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignFormSignPage(
          state: state,
        ),
      ),
    );
    print(name);
    controller.text = name;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignFormBloc>();
    final state = context.select((SignFormBloc bloc) => bloc.state);

    event(String name) {
      bloc.add(ChangeNameEvent(name));
    }

    move() async {
      print('will send to ');
      print(state.name);
    }

    return AppScaffold(
      title: 'formulário',
      actions: [
        BlocConsumer<SignFormBloc, SignFormState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                event(controller.text);
              },
              icon: const Icon(Icons.arrow_forward),
            );
          },
          listener: (context, state) {
            toSignRoute(context, state);
          },
        )
        // IconButton(
        //   onPressed: () async {
        //     event(controller.text);
        //     await move();
        //   },
        //   icon: const Icon(Icons.arrow_forward),
        // ),
      ],
      body: Column(
        children: [
          Text(state.name),
          SignFormInput(
            label: 'nome',
            controller: controller,
          )
        ],
      ),
    );
  }
}
