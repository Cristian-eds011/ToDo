import 'package:flutter/material.dart';
import 'package:olamundo/src/home/components/list/list_controller.dart';

class ListToDoView extends StatefulWidget {
  ListToDoView({Key? key}) : super(key: key);

  final ListController controller = ListController();

  void salvarTarefa(Map<String, Object>? mapNovaTarefa) {
    controller.salvarTarefa(mapNovaTarefa);
  }

  @override
  _ListToDoViewState createState() => _ListToDoViewState();
}

class _ListToDoViewState extends State<ListToDoView> {

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return dissmisibleItem(widget.controller.listaTarefas[index]);
              },
              itemCount: widget.controller.listaTarefas.length,
            ),
          ),
          Container(height: 80,)
        ],
      ),
    );
  }

  Widget dissmisibleItem(itemVez) {
    return Dismissible(
      background: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 212, 61, 61)
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        alignment: AlignmentDirectional.centerStart,
        child: const Icon(
          Icons.delete,
          size: 35,
          color: Colors.red,
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: buildItem2(itemVez),
      key: Key(
        itemVez['id'].toString(),
      ),
      onDismissed: (direction) {
        widget.controller.deletarItem(int.parse(itemVez['id'].toString()));
      },
    );
  }

  Widget buildItem2(item) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 32, 81, 121),
            Color.fromARGB(255, 189, 168, 106)
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(5),
        title: Text(
          item['tarefa'],
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        trailing: IconButton(
          onPressed: () {
            widget.controller.deletarItem(int.parse(item['id'].toString()));
          },
          icon: const Icon(
            Icons.delete,
            color: Color.fromARGB(255, 25, 42, 56),
            size: 25,
          ),
        ),
        leading: Checkbox(
          activeColor: const Color.fromARGB(255, 255, 206, 30),
          value: item['feita'] == true,
          onChanged: (value) {
            widget.controller.checkController(item);
            widget.controller.alterarStatus();
          },
        ),
      ),
    );
  }
}
