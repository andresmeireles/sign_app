import 'package:flutter/material.dart';

class CanDisableElevatedButton extends StatelessWidget {
  final bool disable;
  final void Function() onPressed;
  final Widget child;

  const CanDisableElevatedButton({
    required this.disable,
    required this.onPressed,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _disableStyle() {
      return ElevatedButton.styleFrom(
        onSurface: Colors.red,
        primary: Colors.grey,
        onPrimary: Colors.greenAccent,
      );
    }

    return ElevatedButton(
      style: disable ? _disableStyle() : ElevatedButton.styleFrom(),
      onPressed: disable ? () {} : onPressed,
      child: disable ? const Text('executando') : child,
    );
  }
}
