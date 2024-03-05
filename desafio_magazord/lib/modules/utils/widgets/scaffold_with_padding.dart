import 'package:flutter/material.dart';

class ScaffoldWithPadding extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  const ScaffoldWithPadding({
    super.key,
    this.appBar,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: body,
        ),
      ),
    );
  }
}
