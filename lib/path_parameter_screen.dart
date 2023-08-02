import 'package:flutter/material.dart';
import 'package:go_router_sample/styles.dart';

class PathParameterScreen extends StatelessWidget {
  final int id;

  const PathParameterScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("パスパラメータ"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text("id: $id", style: resultTextStyle),
      ),
    );
  }
}
