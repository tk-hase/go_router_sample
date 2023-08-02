import 'package:flutter/material.dart';
import 'package:go_router_sample/styles.dart';

class ExtraScreen extends StatelessWidget {
  final int? id;
  final String? name;
  final DateTime? transitionDate;

  const ExtraScreen(this.id, this.name, this.transitionDate, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Extraオブジェクト"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("id: $id", style: resultTextStyle),
          Text("name: $name", style: resultTextStyle),
          Text("transition date: $transitionDate", style: resultTextStyle),
        ]),
      ),
    );
  }
}
