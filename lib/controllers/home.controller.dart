import '../services/native.api.dart';

class HomeController {
  final Function setState;
  HomeController(this.setState);
  List<String> listName = [];
  String nameRandom = '';

  capturingList() async {
    final list = await NativeApi().callListName();
    listName.clear();
    listName.addAll(list);
    setState();
  }

  addNameUser({required String name}) async {
    await NativeApi().addNameUser(name: name);
    capturingList();
  }

  removeName({required int index}) async {
    await NativeApi().removeNameUser(index: index);
    capturingList();
  }

  randomName() async {
    nameRandom = await NativeApi().randomNameUser();
    setState();
  }

  clearList() async {
    await NativeApi().clearList();
    capturingList();
  }
}
