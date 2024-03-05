import 'package:flutter/material.dart';

class ExpandedElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;

  const ExpandedElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            child: child,
          ),
        ),
      ],
    );
  }
}

class ExpandedElevatedIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget label, icon;

  const ExpandedElevatedIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: onPressed,
            icon: icon,
            label: label,
          ),
        ),
      ],
    );
  }
}
