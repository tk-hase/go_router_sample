import 'package:flutter/material.dart';
import 'package:go_router_sample/extra_model.dart';
import 'package:go_router_sample/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '画面遷移サンプル',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _TransitionType? _selectedTransitionType = _TransitionType.queryParameter;
  final _queryParam1Controller = TextEditingController();
  final _queryParam2Controller = TextEditingController();
  final _pathParamController = TextEditingController();
  final _extraIdController = TextEditingController();
  final _extraNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            for (var type in _TransitionType.values)
              RadioListTile<_TransitionType>(
                title: Text(type.displayName),
                value: type,
                groupValue: _selectedTransitionType,
                onChanged: _onTransitionTypeChanged,
              ),
            const SizedBox(height: 8),
            _optionsWidget(),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: _onScreenTransitionPressed, child: const Text("画面遷移する")),
          ],
        ),
      ),
    );
  }

  Widget _optionsWidget() {
    final Widget content;
    switch (_selectedTransitionType) {
      case _TransitionType.queryParameter:
        content = _queryParameterOptions();
      case _TransitionType.pathParameter:
        content = _pathParameterOptions();
      default:
        content = _extraOptions();
    }

    return Padding(padding: const EdgeInsets.symmetric(horizontal: 32), child: content);
  }

  /// クエリパラメータ オプション
  Widget _queryParameterOptions() {
    return Column(
      children: [
        _queryParamValue("param1", _queryParam1Controller),
        _queryParamValue("param2", _queryParam2Controller),
      ],
    );
  }

  Widget _queryParamValue(String label, TextEditingController controller) {
    return Row(
      children: [
        Text("$label:"),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: controller,
            maxLines: 1,
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    );
  }

  Widget _pathParameterOptions() {
    return Row(
      children: [
        const Text("id:"),
        const SizedBox(width: 8),
        TextField(
          controller: _pathParamController,
          maxLines: 1,
          decoration: const InputDecoration(constraints: BoxConstraints(maxWidth: 60)),
          keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
        ),
      ],
    );
  }

  Widget _extraOptions() {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {0: FixedColumnWidth(70.0)},
      children: [
        _extraValue("id", _extraIdController, const TextInputType.numberWithOptions(signed: false, decimal: false)),
        _extraValue("name", _extraNameController, TextInputType.text),
      ],
    );
  }

  TableRow _extraValue(String label, TextEditingController controller, TextInputType keyboardType) {
    return TableRow(
      children: [
        TableCell(child: Text("$label:")),
        TableCell(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(constraints: BoxConstraints(maxWidth: 60)),
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }

  void _onTransitionTypeChanged(_TransitionType? value) {
    setState(() {
      _selectedTransitionType = value;
    });
  }

  void _onScreenTransitionPressed() {
    switch (_selectedTransitionType) {
      case _TransitionType.queryParameter:
        final param1Value = _queryParam1Controller.text;
        final param2Value = _queryParam2Controller.text;
        QueryParameterRoute(param1: param1Value, param2: param2Value).go(context);
        break;
      case _TransitionType.pathParameter:
        final id = int.parse(_pathParamController.text);
        PathParameterRoute(id).go(context);
        break;
      default:
        final id = int.parse(_extraIdController.text);
        final name = _extraNameController.text;
        final transitionDate = DateTime.now();
        ExtraRoute($extra: ExtraModel(id, name, transitionDate)).go(context);
    }
  }
}

enum _TransitionType {
  queryParameter("クエリパラメータ"),
  pathParameter("パスパラメータ"),
  extra("extraを使用");

  final String displayName;
  const _TransitionType(this.displayName);
}
