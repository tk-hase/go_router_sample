import 'package:flutter/material.dart';
import 'package:go_router_sample/styles.dart';

class QueryParameterScreen extends StatelessWidget {
  final String? param1;
  final String? param2;

  const QueryParameterScreen(this.param1, this.param2, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("クエリパラメータ"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("param1: ${param1 ?? "(empty)"}", style: resultTextStyle),
            Text("param2: ${param2 ?? "(empty)"}", style: resultTextStyle),
          ],
        ),
      ),
    );
  }
}
