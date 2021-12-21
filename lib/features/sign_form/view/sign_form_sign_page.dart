import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widget/scaffold/app_scaffold.dart';

import '../sign_form.dart';

class SignFormSignPage extends StatelessWidget {
  final SignFormState state;

  const SignFormSignPage({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignFormBloc(state: state),
      child: const _SignFormSignView(),
    );
  }
}

class _SignFormSignView extends StatelessWidget {
  const _SignFormSignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SignFormBloc>();
    final state = context.select((SignFormBloc bloc) => bloc.state);
    final controller = TextEditingController(text: state.name);

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(controller.text);
        return true;
      },
      child: AppScaffold(
        title: 'assinatura',
        body: Column(
          children: [
            Text(state.name),
            SignFormInput(label: 'qualuqer', controller: controller),
          ],
        ),
      ),
    );
  }
}
