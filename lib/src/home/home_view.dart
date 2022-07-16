import 'package:flutter/material.dart';
import 'package:olamundo/src/home/components/input/input_view.dart';
import 'package:olamundo/src/home/components/list/list_todo_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ListToDoView listToDoView = ListToDoView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Lista de tarefas:'),
        elevation: 10,
        actions: [
          IconButton(onPressed: showInputView, icon: const Icon(Icons.add))
        ],
      ),
      body: listToDoView,
      backgroundColor: const Color.fromARGB(255, 232, 240, 241),
      floatingActionButton: createFloatButton(),
    );
  }

  Future<InputView?> showInputView() {
    return showModalBottomSheet<InputView>(
      context: context,
      builder: (BuildContext context) {
        return InputView(listToDoView.salvarTarefa);
      },
    );
  }

  Widget createFloatButton() {
    return FloatingActionButton(
      onPressed: () {
        showInputView();
      },
      child: const Icon(Icons.add),
    );
  }
}
