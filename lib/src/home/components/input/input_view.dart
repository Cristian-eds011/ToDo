import 'package:flutter/material.dart';

class InputView extends StatefulWidget {
  final void Function(Map<String, Object>) novaTarefa;

  InputView(this.novaTarefa, {Key? key}) : super(key: key);

  @override
  _InputViewState createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {
  final _textController = TextEditingController();

  void enviarMap(text) {
    widget.novaTarefa({'tarefa': text});
    _textController.text = '';
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              onSubmitted: (teste) {
                enviarMap(_textController.text.trim());
              },
              autofocus: true,
              controller: _textController,
              decoration: const InputDecoration(hintText: 'Informe a tarefa:'),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
            child: ElevatedButton(
              onPressed: () {
                enviarMap(_textController.text.trim());
              },
              child: const SizedBox(
                width: 150,
                height: 50,
                child: Center(child: Text('Salvar nova tarefa')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
