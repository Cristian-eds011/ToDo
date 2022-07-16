import 'package:flutter/foundation.dart';

class ListController extends ChangeNotifier {
  int idController = 4;

  final ValueNotifier<List<Map<String, Object>>> _listaTarefas = ValueNotifier([
    {'tarefa': 'Tarefa 2', 'feita': true, 'id': 1},
    {'tarefa': 'Tarefa 3', 'feita': false, 'id': 2},
    {'tarefa': 'Tarefa 1', 'feita': true, 'id': 3},
  ]);

  List<Map<String, Object>> get listaTarefas => _listaTarefas.value;

  set listaTarefas(List<Map<String, Object>> listaNova) =>
      _listaTarefas.value = listaNova;

  void deletarItem(int id) {
    _listaTarefas.value.removeWhere((element) => element['id'] == id);
    notifyListeners();
  }

  void alterarStatus() {
    notifyListeners();
  }

  void salvarTarefa(Map<String, Object>? novaTarefa) {
    if(novaTarefa?['tarefa'] != '') {
    novaTarefa?['id'] = idController++;
    novaTarefa?['status'] = false;
    listaTarefas.add(novaTarefa!);
    notifyListeners();
    }
  }

  void checkController(item) {
    if (item['feita'] == true) {
      item['feita'] = false;
    } else {
      item['feita'] = true;
    }
  }
}
